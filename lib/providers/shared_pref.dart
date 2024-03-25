import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {

  // Llaves de acceso para los datos persistentes

  static const String darkModeKey = 'DarkMode';
  static const String hourKey = 'notif_hour';
  static const String minuteKey = 'notif_minute';

  static final UserPrefs instance = UserPrefs._();

  factory UserPrefs() {

    return instance;

  }

  UserPrefs._();
  SharedPreferences? _prefs;

  initPrefs() async {

    _prefs = await SharedPreferences.getInstance();

  }

  // Valores para guardar la configuración del modo obscuro

  bool get darkMode {

    return _prefs!.getBool(darkModeKey) ?? true;

  }

  set darkMode(bool value) {

    _prefs!.setBool(darkModeKey, value);

  }

  // Valores para guardar la hora y minuto para notificaciones

  int get hour {

    return _prefs!.getInt(hourKey) ?? 61; // Avoid '0 - 24' to config after

  }

  set hour(int value) {

    _prefs!.setInt(hourKey, value);

  }

  int get minute {

    return _prefs!.getInt(minuteKey) ?? 61; // Avoid '0 - 60' to config after

  }

  set minute(int value) {

    _prefs!.setInt(minuteKey, value);

  }

  deleteTime() {

    _prefs!.remove(hourKey);
    _prefs!.remove(minuteKey);

  }

}

