
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
setUser(bool value) async {
SharedPreferences instance = await SharedPreferences.getInstance();
instance.setBool('USER', value);
}

getUser() async {
SharedPreferences instance = await SharedPreferences.getInstance();
bool? userStatus = instance.getBool('USER');

// if (userStatus == null) {
//   return false;
// } else {
//   return userStatus;
// }

return userStatus ?? false;
}
  void saveUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
  }

  Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }
}