enum ErrorType {
  /// It occurs when url is opened timeout.
  connectTimeout,

  /// It occurs when url is noConnection.
  noConnection,

  /// When the server response, but with a incorrect status, such as 404, 503...
  response,

  /// When the request is cancelled, dio will throw a error with this type.
  cancel,

  /// When the request is unauthorize.
  unauthorize,

  /// Default error type, Some other Error. In this case, you can
  /// use the ApiError.error if it is not null.
  unknownError,
}

/// ApiError describes the error info  when request failed.
class ApiErrorModel implements Exception {
  const ApiErrorModel({
    this.type = ErrorType.unknownError,
    this.error,
    this.errorCode,
    this.description,
    this.message,
    this.stack,
  });

  final ErrorType type;
  final Map? errorCode;
  final String? description;
  final String? message;
  final String? stack;

  /// The original error/exception object; It's usually not null when `type`
  /// is ErrorType.DEFAULT
  final dynamic error;

  String get errorMessage => message ?? (error?.toString() ?? '');
  Map get errorCodeMessage => (errorCode) ?? {};

  @override
  String toString() {
    var msg =
        '$type\nDescription: $description\nMessage: $errorMessage\nStack: $stack';
    return msg;
  }

  /// Factory method to create an ApiError from a map
  factory ApiErrorModel.fromMap(Map<String, dynamic> map) {
    return ApiErrorModel(
      type: ErrorType.values.firstWhere(
        (e) => e.toString() == 'ErrorType.${map['type']}',
        orElse: () => ErrorType.unknownError,
      ),
      description: map['description'],
      message: map['message'],
      stack: map['stack'],
      errorCode: map['errorCode'],
      error: map['error'],
    );
  }

  /// Method to convert ApiError to a map
  Map<String, dynamic> toMap() {
    return {
      'type': type.toString().split('.').last,
      'description': description,
      'message': message,
      'stack': stack,
      'errorCode': errorCode,
      'error': error,
    };
  }
}
