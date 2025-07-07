import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // projectManagement Info
  static const String _key = 'auth_info';
  static const String isDarkMode = "theme_value";

  //
  //keys for the remember password
  static const String safeEmail = 'safeEmail';
  static const String safePassword = 'safePassword';

  static Future<void> setRememberData(var mapData) async {
    print("Saving");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(safeEmail, mapData["email__eq"]);
    await prefs.setString(safePassword, mapData["password"]);
  }

  static Future<Map<String, dynamic>> getRememberData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? uKey = prefs.getString(safeEmail);
    String? uPass = prefs.getString(safePassword);

    Map<String, dynamic> mapData = {'email': uKey, 'password': uPass};

    return mapData;
  }

  //setUserInformation
  // Setter method to store the map in shared preferences
  static Future<void> setAuthInfo(Map<String, dynamic> authMap) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, json.encode(authMap));
  }

  // Getter method to retrieve the map from shared preferences
  static Future<Map<String, dynamic>?> getAuthInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_key);
    if (jsonString != null) {
      return json.decode(jsonString);
    }
    return null;
  }

  static Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(_key);
  }

  static Future<bool?> getOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding');
  }

  // Save the theme type
  static Future<void> saveThemeType(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isDarkMode, value);
  }

  // Retrieve the theme type
  static Future<bool?> getThemeType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isDarkMode);
  }

  //Persisting the state of the app
  static Future<void> setAuditData(Map<String, dynamic> requestData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Map<String, dynamic> requestData = getRequestData();
    await prefs.setString('audit_data', jsonEncode(requestData));
    print("Audit data saved successfully: " + requestData.toString());
  }

  // Function to retrieve and parse request data from SharedPreferences
  static Future<Map<String, dynamic>?> getAuditData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString('audit_data');

    if (jsonData != null) {
      return jsonDecode(jsonData);
    }
    return null; // Return null if no data is found
  }

  // Function to clear saved audit data from SharedPreferences
  static Future<void> clearAuditData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('audit_data');
    print("Audit data cleared successfully");
  }
}
