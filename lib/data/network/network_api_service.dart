import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:tentwenty/data/app_exceptions.dart';
import 'package:tentwenty/data/network/base_api_services.dart';
import 'package:tentwenty/data/network_response_model.dart';
import 'package:tentwenty/res/constants.dart';
import 'package:tentwenty/services/shared_preference_service.dart';
import 'package:tentwenty/view_model/loading_screen_controller.dart';

class NetworkApiServices extends BaseApiServices {
  LoadingController loadingController = Get.find();
  @override
  Future getApi(String url, {bool isAuthroized = true}) async {
    print("getApi");
    print(url);

    dynamic responseJson;
    try {
      Map<String, String> requestHeaders = {};
      if (isAuthroized) {
        String userId = AppConstants.authorizationKey;
        print("USER ID IN GET: " + userId);
        requestHeaders = {
          'Content-Type': 'application/json',
          if (isAuthroized) 'Authorization': 'Bearer $userId',
        };
      } else {
        requestHeaders = {'Content-Type': 'application/json'};
      }
      final response = await http.get(Uri.parse(url), headers: requestHeaders);
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimedOutException {
      throw RequestTimedOutException("");
    }

    return responseJson;
  }

  @override
  Future putApi(
    var data,
    String url,
    Map<String, String>? header, {
    bool isAuthroized = false,
  }) async {
    //   headers?? {
    //   'Content-Type': 'application/json', // Specify the content type
    // };
    Map<String, String> requestHeaders = {};
    if (isAuthroized) {
      String userId = AppConstants.authorizationKey;

      print("USER ID IN POST: " + userId);
      requestHeaders = {
        'Content-Type': 'application/json',
        if (isAuthroized) 'Authorization': 'Bearer $userId',
      };
    } else {
      requestHeaders = {'Content-Type': 'application/json'};
    }

    print("putApi");
    print(url);
    print(data);
    dynamic responseJson;
    try {
      final response = await http.put(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: requestHeaders,
      );
      responseJson = returnResponse(response);
    } on SocketException {
      print("Socket exception");

      throw InternetException("");
    } on RequestTimedOutException {
      print("Req timed out");
      throw RequestTimedOutException("");
    }

    return responseJson;
  }

  @override
  Future postApi(
    var data,
    String url,
    Map<String, String>? header, {
    bool isAuthroized = false,
  }) async {
    final int _timeoutDuration = 140; // Timeout duration in seconds

    Map<String, String> requestHeaders = {};
    if (isAuthroized) {
      String userId =
          (await SharedPreferencesService.getAuthInfo())!['access_token'];
      print("USER ID IN POST: " + userId);
      requestHeaders = {
        'Content-Type': 'application/json',
        if (isAuthroized) 'Authorization': 'Bearer $userId',
      };
    } else {
      requestHeaders = {'Content-Type': 'application/json'};
    }

    print("postAPI");
    print(url);
    print(data);
    dynamic responseJson;

    for (int attempt = 0; attempt < 3; attempt++) {
      try {
        final response = await http
            .post(
              Uri.parse(url),
              body: jsonEncode(data),
              headers: requestHeaders,
            )
            .timeout(Duration(seconds: _timeoutDuration));
        responseJson = returnResponse(response);
        return responseJson;
      } on SocketException {
        print("Socket exception on attempt $attempt");
        if (attempt == 2) {
          throw InternetException("No internet connection");
        }
      } on RequestTimedOutException {
        print("Request timed out on attempt $attempt");
        if (attempt == 2) {
          throw RequestTimedOutException("Request timed out");
        }
      }
    }
    return responseJson;
  }

  Future<String> uploadFile(String filePath, String url) async {
    print("PATH TO SEND File TO: " + url.toString());
    print("FILEPATH: " + filePath.toString());
    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(url));
    var name = path.basename(filePath);
    // Add the image file to the request
    var file = await http.MultipartFile.fromPath("file", filePath);
    request.files.add(file);

    // Send the request
    var response = await request.send();

    // Check if the request was successful
    if (response.statusCode == 200) {
      String res = await response.stream.bytesToString();

      print('File uploaded successfully. Image URL: $res');

      return res;
    } else {
      print('Failed to upload File. Status code: ${response.statusCode}');
    }
    return "";
  }

  dynamic returnResponse(http.Response response) {
    print("BODY: " + response.body.toString());
    print("Status Code: " + response.statusCode.toString());
    var resBody;

    try {
      resBody = jsonDecode(response.body);
    } catch (e) {
      resBody = response.body;
    }
    return NetworkResModel(statusCode: response.statusCode, response: resBody);
  }

  @override
  Future deleteApi(
    var data,
    String url,
    Map<String, String>? header, {
    bool isAuthroized = false,
  }) async {
    //   headers?? {
    //   'Content-Type': 'application/json', // Specify the content type
    // };
    Map<String, String> requestHeaders = {};
    if (isAuthroized) {
      String userId =
          (await SharedPreferencesService.getAuthInfo())!['access_token'];
      print("USER ID IN delete: " + userId);
      requestHeaders = {
        'Content-Type': 'application/json',
        if (isAuthroized) 'Authorization': 'Bearer $userId',
      };
    } else {
      requestHeaders = {'Content-Type': 'application/json'};
    }

    print("deleteApi");
    print(url);
    print(data);
    dynamic responseJson;
    try {
      final response = await http.delete(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: requestHeaders,
      );
      responseJson = returnResponse(response);
    } on SocketException {
      print("Socket exception");

      throw InternetException("");
    } on RequestTimedOutException {
      print("Req timed out");
      throw RequestTimedOutException("");
    }

    return responseJson;
  }
}
