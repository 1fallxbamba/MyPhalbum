class APIResponse {
  final String status;
  final String code;
  final dynamic message;
  final dynamic data;

  APIResponse(
      {required this.status,
      required this.code,
      required this.message,
      required this.data});

  List<Object?> get props => [status, code, message, data];

  Map<String, dynamic> toMap() {
    return {'Status': status, 'Code': code, 'Message': message, 'Data': data};
  }

  factory APIResponse.fromMap(Map<String, dynamic> apiResponseMap) {
    return APIResponse(
      status: apiResponseMap['Status'],
      code: apiResponseMap['Code'],
      message: apiResponseMap['Message'],
      data: apiResponseMap['Data'],
    );
  }

  factory APIResponse.networkError() {
    return APIResponse(
        status: 'ERROR', code: 'NETERR', message: null, data: null);
  }
}
