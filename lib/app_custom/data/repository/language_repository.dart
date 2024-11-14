import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productivity_app/app_custom/domain/repository/language_repository.dart';
import 'package:productivity_app/core/utils/consts/string_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  late SharedPreferences pref;

  @override
  Future<String> getLanguage() async {
    pref = await SharedPreferences.getInstance();
    String? lanCode = pref.getString(StringConst.languageKey) ?? 'en';
    return lanCode;
  }

  @override
  Future<void> updateLanguage(String languageCode) async {
    pref = await SharedPreferences.getInstance();
    await pref.setString(StringConst.languageKey, languageCode);
    Get.snackbar("Language changed",
        "Language changed to ${languageCode == 'en' ? "English" : "Spanish"}",
        dismissDirection: DismissDirection.down, backgroundColor: Colors.white);
  }
}
