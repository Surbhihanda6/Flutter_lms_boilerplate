import 'package:either_dart/either.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import '../../../common/models/api_error_model.dart';
import '../../../common/storage/storage.dart';
import '../../../common/utils/utils.dart';
import '../../../common/values/api_strings.dart';
import '../../../data/api_helper_impl.dart';
import '../model/user_model.dart';

class LoginService {
  final AppNetworkService _networkService = AppNetworkService();

  Future<bool> login(Map userLoginData) async {
    Either<Exception, Response<dynamic>> result =
        await _networkService.postRequest(
      ApiRoutes.loginApiRoutes.loginApiRoute,
      userLoginData,
    );

    if (result.isRight && result.right.statusCode == 200) {
      // Do something with the response
      return true;
    } else {
      // Do something with the error
      ApiErrorModel errorModel = result.left as ApiErrorModel;
      Utils.showErrorSnackBar(errorModel.message);
      return false;
    }
  }

  Future<bool> verifyOtp(Map userOtpData) async {
    Either<Exception, Response<dynamic>> result =
        await _networkService.postRequest(
      ApiRoutes.loginApiRoutes.verifyOtpApiRoute,
      userOtpData,
    );

    if (result.isRight && result.right.statusCode == 200) {
      // Do something with the response
      UserModel userDataModel = UserModel.fromJson(result.right.body);
      await AppStorage.saveUserModel(userDataModel);
      return true;
    } else {
      // Do something with the error
      ApiErrorModel errorModel = result.left as ApiErrorModel;
      Utils.showErrorSnackBar(errorModel.message);
      return false;
    }
  }
}
