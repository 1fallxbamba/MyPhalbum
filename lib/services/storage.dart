import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void saveLocalData(String _key, String _value) async {
  prefs = await SharedPreferences.getInstance();
  prefs.setString(_key, _value);
}

Future<String?> getLocalData(String _key) async {
  prefs = await SharedPreferences.getInstance();
  return prefs.getString(_key);
}
