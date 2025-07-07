class NetworkResModel {
  int statusCode;
  dynamic response;

  NetworkResModel({
    required this.statusCode,
    required this.response,
  });

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'response': response,
    };
  }
}
