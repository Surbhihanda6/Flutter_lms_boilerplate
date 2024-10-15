import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:either_dart/either.dart';
import 'package:get/get_connect/connect.dart';
import '../common/constants.dart';
import '../common/models/api_error_model.dart';
import '../common/models/api_success_model.dart';
import '../common/storage/storage.dart';
import '../common/utils/utils.dart';
import '../common/values/api_strings.dart';
import 'api_response.dart';

class AppNetworkService extends GetConnect {
  AppNetworkService() {
    httpClient.baseUrl = ApiRoutes.baseAppUrl;
    httpClient.timeout = const Duration(seconds: 20);
    httpClient.defaultContentType = 'application/json';
    httpClient.addRequestModifier<void>((request) {
      request.headers[HttpHeaders.userAgentHeader] = 'getconnect';
      return request;
    });
  }

  Future<Either<Exception, Response>> getRequest(
    String url, {
    String? contentType,
    Map<String, dynamic>? query,
    Object? data,
    String? secretKey,
    Function? onRetry,
  }) async {
    if (!await Utils.isInternetConnected()) {
      // g.Get.toNamed(
      //   Routes.SPLASH,
      //   arguments: onRetry,
      // );
      Utils.showErrorSnackBar(
        "Please check your internet connection and try again",
      );
      return Left(Exception(ErrorType.noConnection));
    }
    try {
      String accessToken = await AppStorage.getAccessToken() ?? '';
      var response = await get(
        url,
        query: query,
        headers: secretKey != null
            ? {
                'secret-key': secretKey,
              }
            : {
                'access-token': accessToken,
              },
      );
      return Right(response);
    } on HttpException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Exception("Exception ${e.toString()}"));
    }
  }

  Future<Either<ApiErrorModel, Response>> postRequest(
    String url,
    dynamic body, {
    Map<String, dynamic>? query,
    Map<String, String>? files,
    Function? onRetry,
  }) async {
    if (!await Utils.isInternetConnected()) {
      // g.Get.toNamed(
      //   Routes.SPLASH,
      //   arguments: onRetry,
      // );
      Utils.showErrorSnackBar(
        "Please check your internet connection and try again",
      );
      return const Left(ApiErrorModel(type: ErrorType.noConnection));
    }
    try {
      String accessToken = await AppStorage.getAccessToken() ?? '';

      if (files != null && files.isNotEmpty) {
        FormData formData = FormData({
          ...body,
          ...files.map(
            (key, value) => MapEntry(
              key,
              MultipartFile(
                File(value),
                filename: value.split('/').last,
                contentType: (value.split('.').last == 'jpg' ||
                        value.split('.').last == 'png' ||
                        value.split('.').last == 'jpeg')
                    ? 'image/${value.split('.').last}'
                    : '',
              ),
            ),
          ),
        });

        var response = await post(
          url,
          formData,
          headers: {
            'access-token': accessToken,
          },
        );
        return Right(response);
      } else {
        var response = await post(
          url,
          body,
          headers: accessToken != ""
              ? {
                  'access-token': accessToken,
                }
              : null,
        );
        if (response.hasError) {
          return Left(
            ApiErrorModel.fromMap(
              response.body['error'],
            ),
          );
        }
        return Right(response);
      }
    } on HttpException catch (e) {
      return Left(ApiErrorModel(error: e));
    } catch (e) {
      return Left(ApiErrorModel(error: e));
    }
  }

  Future<Either<Exception, Response>> putRequest(
    String url,
    dynamic body, {
    Map<String, dynamic>? query,
    Map<String, String>? files,
    Function? onRetry,
  }) async {
    if (!await Utils.isInternetConnected()) {
      // g.Get.toNamed(
      //   Routes.SPLASH,
      //   arguments: onRetry,
      // );
      Utils.showErrorSnackBar(
        "Please check your internet connection and try again",
      );
      return Left(Exception(ErrorType.noConnection));
    }
    try {
      String accessToken = await AppStorage.getAccessToken() ?? '';

      if (files != null && files.isNotEmpty) {
        FormData formData = FormData({
          ...body,
          ...files.map(
            (key, value) => MapEntry(
              key,
              MultipartFile(
                File(value),
                filename: value.split('/').last,
              ),
            ),
          ),
        });

        var response = await put(
          url,
          formData,
          headers: {
            'access-token': accessToken,
          },
        );
        return Right(response);
      } else {
        var response = await put(
          url,
          body,
          headers: {
            'access-token': accessToken,
          },
        );
        return Right(response);
      }
    } on HttpException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Exception("Exception ${e.toString()}"));
    }
  }

  Future<Either<Exception, Response>> patchRequest(
    String url,
    dynamic body, {
    Map<String, dynamic>? query,
    Map<String, String>? files,
    Function? onRetry,
  }) async {
    if (!await Utils.isInternetConnected()) {
      // g.Get.toNamed(
      //   Routes.SPLASH,
      //   arguments: onRetry,
      // );
      Utils.showErrorSnackBar(
        "Please check your internet connection and try again",
      );
      return Left(Exception(ErrorType.noConnection));
    }
    try {
      String accessToken = await AppStorage.getAccessToken() ?? '';

      if (files != null && files.isNotEmpty) {
        FormData formData = FormData({
          ...body,
          ...files.map(
            (key, value) => MapEntry(
              key,
              MultipartFile(
                File(value),
                filename: value.split('/').last,
              ),
            ),
          ),
        });

        var response = await patch(
          url,
          formData,
          headers: {
            'access-token': accessToken,
          },
        );
        return Right(response);
      } else {
        var response = await patch(
          url,
          body,
          headers: {
            'access-token': accessToken,
          },
        );
        return Right(response);
      }
    } on HttpException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Exception("Exception ${e.toString()}"));
    }
  }

  Future<Either<Exception, dynamic>> handleRequest({
    required String apiRoute,
    required RequestType requestType,
    dynamic body,
    Map<String, String>? files,
    bool sendRawResponse = false,
    Function? onRetry,
  }) async {
    try {
      Either<Exception, Response<dynamic>> result;

      switch (requestType) {
        case RequestType.GET:
          result = await getRequest(
            apiRoute,
            onRetry: onRetry,
          );
          break;
        case RequestType.POST:
          result = await postRequest(
            apiRoute,
            body,
            files: files,
            onRetry: onRetry,
          );
          break;
        case RequestType.PUT:
          result = await putRequest(
            apiRoute,
            body,
            files: files,
            onRetry: onRetry,
          );
          break;
        case RequestType.PATCH:
          result = await patchRequest(
            apiRoute,
            body,
            files: files,
            onRetry: onRetry,
          );
          break;
      }

      if (result.isRight) {
        try {
          if (sendRawResponse) {
            return Right(result.right);
          }
          ApiSuccessResponseModel response =
              ApiResponse.getApiResponse(result.right);
          Utils.showSnackbar(response.message, isRequired: false);
          return Right(response);
        } on ApiErrorModel catch (error) {
          Utils.showSnackbar(error.message, isRequired: false);
          return Left(error);
        }
      }
    } catch (e) {
      return Left(Exception(e));
    }

    return Left(Exception(ErrorType.unknownError));
  }

  Future<bool> hasInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }
}
