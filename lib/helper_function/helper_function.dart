import 'package:shared_preferences/shared_preferences.dart';

class HelperFuction {
  static String sharedPreferenceUserLoggedInkey = "ISLOGGEDIN";
  static String sharedPreferenceTime = "Time";
  static String sharedPreferenceCurrentTime = "currentTime";

  static Future<bool> saveUserLogged(bool isLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool(sharedPreferenceUserLoggedInkey, isLoggedIn);
  }

  Future<bool?> getUserSignInSharedpreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(sharedPreferenceUserLoggedInkey);
  }

  clearData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(sharedPreferenceUserLoggedInkey, false);
  }
  // saveDateTime() async {
  //   final DateTime time = DateTime.now();
  //   int timeInt = time.microsecondsSinceEpoch;
  //   // final DateTime d=DateTime.fromMillisecondsSinceEpoch(timeInt);
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setInt(sharedPreferenceTime, timeInt);
  // }

  // getDateTime() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.getInt(sharedPreferenceTime);
  // }

  // currentDateTime() async {
  //   final DateTime time = DateTime.now();
  //   int timeInt = time.microsecondsSinceEpoch;
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setInt(sharedPreferenceCurrentTime, timeInt);
  // }

  // getCurrentDateTime() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.getInt(sharedPreferenceCurrentTime);
  // }

  // checkHour() async {
  //   final int currentTime = await getCurrentDateTime();
  //   final int loginTime = await getDateTime();
  //   if (currentTime - loginTime >= 10) {
  //     SharedPreferences preferences = await SharedPreferences.getInstance();
  //     preferences.setBool(sharedPreferenceUserLoggedInkey, false);
  //   }
  // }

}
