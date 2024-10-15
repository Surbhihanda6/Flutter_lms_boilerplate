// import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:either_dart/either.dart';
// import 'package:get/route_manager.dart';
// import 'package:get/get.dart' as g;
// import 'package:regenesys_lms_mobile/app/common/models/api_success_model.dart';
// import 'package:regenesys_lms_mobile/app/common/utils/garbage_collector.dart';
// import 'package:regenesys_lms_mobile/app/common/utils/utils.dart';
// import 'package:regenesys_lms_mobile/app/common/values/api_strings.dart';
// import 'package:regenesys_lms_mobile/app/data/api_helper_impl.dart';
// import 'package:regenesys_lms_mobile/app/data/api_response.dart';
// import 'package:regenesys_lms_mobile/app/routes/app_pages.dart';
// import '../common/constants.dart';
// import '../common/storage/storage.dart';

// class ApiInterceptors extends Interceptor {
//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     final deviceInfoPlugin = DeviceInfoPlugin();

//     String deviceName = "";
//     String deviceModel = "";
//     String versionName = "";

//     if (Platform.isAndroid) {
//       final androidInfo = await deviceInfoPlugin.androidInfo;

//       deviceName = androidInfo.brand;
//       deviceModel = androidInfo.model;
//       versionName = androidInfo.version.release;
//     }

//     String languagePreference =
//         await AppStorage.getValue(StorageKeys.selectedLanguage) ?? 'en';

//     options.headers['device-name'] = deviceName;
//     options.headers['device-model'] = deviceModel;
//     options.headers['version-name'] = versionName;
//     options.headers['language'] = languagePreference;

//     super.onRequest(requestInterceptor(options), handler);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     // Handle expired/invalid token scenario
//     if (err.response?.statusCode != null && err.response?.statusCode == 401) {
//       // dispose all variables
//       GarbageCollector.clear();
//       Utils.showSnackbar("token_expired_try_again".tr);
//       // TODO Change this route
//       Get.offAllNamed(Routes.SPLASH);
//       // clear the token
//       AppStorage.deleteAccessToken();
//       return;
//     }
//     // refreshToken(err: err, handler: handler);
//     super.onError(err, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // do something before response
//     responseInterceptor(response);
//     super.onResponse(response, handler);
//   }

//   void responseInterceptor(response) {
//     // printInfo(
//     //   info: 'Status Code: ${response.statusCode}\n'
//     //       'Data: ${response.bodyString?.toString() ?? ''}',
//     // );
//   }

//   RequestOptions requestInterceptor(RequestOptions options) {
//     // if (AppStorage.hasData(StorageKeys.accessToken)) {
//     //   options.headers['access-token'] =
//     //       AppStorage.getValue(StorageKeys.accessToken);
//     // }
//     return options;
//   }

//   Future<void> refreshToken({
//     required DioException err,
//     required ErrorInterceptorHandler handler,
//   }) async {
//     Dio dio = Dio();
//     final ApiHelperImpl networkService = ApiHelperImpl();

//     try {
//       var response = await dio.post(
//         ApiRoutes.refreshToken,
//         data: {
//           "refresh_token": AppStorage.getValue(StorageKeys.refreshToken),
//         },
//       );
//       if (response.statusCode == 200) {
//         ApiSuccessResponseModel result = ApiResponse.getApiResponse(response);
//         if (result.status) {
//           // update access token
//           await AppStorage.saveAccessToken(
//             response.data['access_token'],
//           );
//           // retry the failed request
//           RequestType requestType = RequestType.GET;
//           switch (err.requestOptions.method) {
//             case "GET":
//               requestType = RequestType.GET;
//               break;
//             case "POST":
//               requestType = RequestType.POST;
//               break;
//             case "PUT":
//               requestType = RequestType.PUT;
//               break;
//             case "PATCH":
//               requestType = RequestType.PATCH;
//               break;
//           }
//           Either<Exception, dynamic> result =
//               await networkService.handleRequest(
//             apiRoute: err.requestOptions.path,
//             requestType: requestType,
//             sendRawResponse: true,
//           );
//           if (result.isRight) {
//             return handler.resolve(result.right);
//           }
//         } else {
//           Utils.showSnackbar("token_expired_try_again".tr);

//           GarbageCollector.clear();
//           // TODO Change this route
//           Get.offAllNamed(Routes.SPLASH);

//           AppStorage.deleteAccessToken();
//         }
//       } else {
//         // handle refresh token API failure
//         Utils.showSnackbar("token_expired_try_again".tr);

//         GarbageCollector.clear();
//         // TODO Change this route
//         Get.offAllNamed(Routes.SPLASH);

//         AppStorage.deleteAccessToken();
//       }
//     } catch (e) {
//       // handle refresh token API error
//       Utils.showSnackbar("token_expired_try_again".tr);

//       GarbageCollector.clear();
//       // TODO Change this route
//       Get.offAllNamed(Routes.SPLASH);

//       AppStorage.deleteAccessToken();
//     }
//   }
// }
