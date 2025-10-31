import 'package:shared_preferences/shared_preferences.dart';

class FullSharedPreferences {
  static const String usernamekey = 'user_name';
  static const String useremailkey = 'user_email';
  static const String usertokenkey = 'user_token';
  static const String islogedinkey = 'is_logged_in';

  //saving user details

  static Future<void> saveUserData(
      {required String name,
      required String email,
      required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(usernamekey, name);
    await prefs.setString(useremailkey, email);
    await prefs.setString(usertokenkey, token);
    await prefs.setBool(islogedinkey, true);
  }

//getting username
  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(usernamekey);
  }

  // login checking

  static Future<bool> isLogedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(islogedinkey) ?? false;
  }
  //logout section

  static Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
