import 'dart:async';
import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';

import '../common/models/api_error_model.dart';
import '../common/models/api_success_model.dart';
import '../common/values/strings.dart';

abstract class ApiResponse {
  static T? _parseResponse<T>(Response<T> response) {
    final status = response.statusCode;

    if (status != 200) {
      throw const ApiErrorModel(
        type: ErrorType.noConnection,
        error: "No connection. Please turn on your internet!",
      );
    }

    if (response.body == null) {
      throw const ApiErrorModel();
    }

    try {
      String result = response.body! as String;
      final res = jsonDecode(result);

      if (res != null) {
        if (res is Map) {
          if (res["status"] != null &&
              !res["status"] &&
              res['error_status'] != null &&
              res['error_code'].toString().isNotEmpty) {
            if (res['error_code'].toString() == 'invalidtoken') {
              throw const ApiErrorModel(
                type: ErrorType.response,
                error: "Unauthorize. Please login again!",
              );
            } else {
              throw ApiErrorModel(
                type: ErrorType.response,
                error: res['message']?.toString() ??
                    (res['message']?.toString() ?? Strings.unknownError),
                errorCode: res['data'] ?? {},
              );
            }
          }
        }

        return jsonDecode(response.body.toString());
      } else {
        // if (response.statusCode) {
        //   throw const ApiError();
        // } else if (status.code == HttpStatus.requestTimeout) {
        //   throw const ApiError(
        //     type: ErrorType.connectTimeout,
        //     error: Strings.connectionTimeout,
        //   );
        // } else if (response.unauthorized) {
        //   throw ApiError(
        //     type: ErrorType.unauthorize,
        //     error: res['msg']?.toString() ?? Strings.unauthorize,
        //   );
        // } else {
        //   throw ApiError(
        //     type: ErrorType.response,
        //     error: res['msg']?.toString() ?? Strings.unknownError,
        //   );
        // }
        throw ApiErrorModel(
          type: ErrorType.response,
          error: res['msg']?.toString() ?? Strings.unknownError,
        );
      }
    } on FormatException {
      throw const ApiErrorModel(
        type: ErrorType.unknownError,
        error: "Unknow error! Please try again after some time.",
      );
    } on TimeoutException catch (e) {
      throw ApiErrorModel(
        type: ErrorType.connectTimeout,
        error: e.message?.toString() ?? Strings.connectionTimeout,
      );
    }
  }

  static ApiSuccessResponseModel getApiResponse(Response<dynamic> response) {
    try {
      return ApiSuccessResponseModel.fromJson(_parseResponse(response));
    } catch (e) {
      rethrow;
    }
  }
}
