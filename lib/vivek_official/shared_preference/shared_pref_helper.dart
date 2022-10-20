import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  SharedPreferences? _prefs;

  SharedPreferenceHelper();

  Future<SharedPreferences> getSharedPreferences() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
      print('aa $_prefs');
    }
    return _prefs!;
  }

  Future<void> setLanguage(String lang) async {
    await getSharedPreferences();
    _prefs?.setString('userLanguage', lang);
  }

  Future<String> getLanguage() async {
    try {
      await getSharedPreferences();
      var language = _prefs?.getString('userLanguage');
      return language!;
    } catch (e) {
      return '';
    }
  }

  Future<void> setNumber(int num) async {
    await getSharedPreferences();
    _prefs?.setInt('number', num);
  }

  Future<int> getNumber() async {
    try {
      await getSharedPreferences();
      var language = _prefs?.getInt('number');
      return language!;
    } catch (e) {
      return 0;
    }
  }
}
