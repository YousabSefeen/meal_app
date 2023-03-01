import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  var theme = ThemeMode.system;
  var primaryColor = Colors.pink;


  String themeText = 's';

  onChangeTheme(newTheme) async {
    theme = newTheme;
    _getThemeMode(theme);
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('themeText', themeText);
    notifyListeners();
  }

  onColorChange(newColor ) async{
     primaryColor = _toMaterialColor(newColor.hashCode);

    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setInt('primaryColor', primaryColor.value);



  }

  _toMaterialColor(colorVal) {
    return MaterialColor(
      colorVal,
      <int, Color>{
        50: const Color(0xFFFCE4EC),
        100: const Color(0xFFF8BBD0),
        200: const Color(0xFFF48FB1),
        300: const Color(0xFFF06292),
        400: const Color(0xFFEC407A),
        500: Color(colorVal),
        600: const Color(0xFFD81B60),
        700: const Color(0xFFC2185B),
        800: const Color(0xFFAD1457),
        900: const Color(0xFF880E4F),
      },
    );
  }

  _getThemeMode(ThemeMode themeMode) {
    if (themeMode == ThemeMode.system) {
      themeText = 's';
    } else if (themeMode == ThemeMode.light) {
      themeText = 'l';
    } else if (themeMode == ThemeMode.dark) {
      themeText = 'd';
    }
  }

  getThemeAndColorPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    themeText = pref.getString('themeText') ?? 's';
    if (themeText == 's') {
      theme = ThemeMode.system;
    } else if (themeText == 'l') {
      theme = ThemeMode.light;
    } else if (themeText == 'd') {
      theme = ThemeMode.dark;
    }

    primaryColor=_toMaterialColor(pref.getInt('primaryColor')?? 0xFFE91E63) ;

    notifyListeners();
  }

}
