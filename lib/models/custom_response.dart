class CustomResponse {
  Map<String, dynamic>? data;
  int? statusCode;
  String? error;

  CustomResponse({this.data, required this.statusCode, this.error});
}