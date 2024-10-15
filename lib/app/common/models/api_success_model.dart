class ApiSuccessResponseModel {
  String? message;
  bool status = false;
  String? type;
  ErrorStatus? errorStatus;
  dynamic data;

  ApiSuccessResponseModel({
    required this.status,
    this.message,
    this.type,
    this.errorStatus,
    this.data,
  });

  ApiSuccessResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'] ?? false;
    type = json['type'];
    errorStatus = json['error_status'] != null
        ? ErrorStatus.fromJson(json['error_status'])
        : null;
    data = json['data'];
  }
}

class ErrorStatus {
  String? errorCode;

  ErrorStatus({this.errorCode});

  ErrorStatus.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
  }
}
