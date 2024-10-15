import '../../modules/login/service/login_api_routes.dart';

enum Environment { dev, uat, prod }

class ApiRoutes {
  ApiRoutes._();

  static const Environment currentEnvironment = Environment.dev;

  static final String baseAppUrl = _getBaseUrl(currentEnvironment);

  static final String refreshToken = "$baseAppUrl/refresh_token/";

  static final LoginApiRoutes loginApiRoutes = LoginApiRoutes();

  static String _getBaseUrl(Environment env) {
    switch (env) {
      case Environment.dev:
        return "https://dev-learn-api.regenesys.digital/api/V1";
      case Environment.uat:
        return "https://dummy-uat.example.com/v1";
      case Environment.prod:
        return "https://dummy-prod.example.com/v1";
      default:
        return "https://dummy-uat.example.com/v1";
    }
  }
}
