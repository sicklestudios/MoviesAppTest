abstract class BaseApiServices {
  Future<dynamic> getApi(String url, {bool isAuthroized = false});
  Future<dynamic> postApi(dynamic data, String url, Map<String, String>? header,
      {bool isAuthroized});
  Future<dynamic> putApi(dynamic data, String url, Map<String, String>? header,
      {bool isAuthroized});
  Future<dynamic> deleteApi(
      dynamic data, String url, Map<String, String>? header,
      {bool isAuthroized});
  Future<dynamic> uploadFile(
    String filePath,
    String url,
  );
}
