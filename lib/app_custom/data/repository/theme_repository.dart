import 'package:productivity_app/app_custom/domain/repository/theme_repository.dart';
import 'package:productivity_app/core/utils/consts/string_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  late SharedPreferences pref;

  @override
  Future<bool> getTheme() async {
    pref = await SharedPreferences.getInstance();

    bool? isDarkTheme = pref.getBool(StringConst.themeKey) ?? false;
    return isDarkTheme;
  }

  @override
  Future<void> updateTheme(bool isDarkTheme) async {
    pref = await SharedPreferences.getInstance();

    await pref.setBool(StringConst.themeKey, isDarkTheme);
  }
}
