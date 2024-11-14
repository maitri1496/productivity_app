import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/app_custom/domain/usecases/get_language_usecase.dart';
import 'package:productivity_app/app_custom/domain/usecases/update_language_usecase.dart';

class LanguageController extends GetxController {
  final GetLanguageUseCase getLanguageUseCase;
  final UpdateLanguageUseCase updateLanguageUseCase;

  LanguageController(
      {required this.getLanguageUseCase, required this.updateLanguageUseCase});

  Future<void> toggleLanguage() async {
    String? storedLanguage = await getLanguageUseCase();
    String currentLang;
    if (storedLanguage.isNotEmpty) {
      currentLang = storedLanguage;
    } else {
      currentLang = Get.locale?.languageCode ?? 'en';
    }
    String newLang = currentLang == 'en' ? 'es' : 'en';
    updateLanguageUseCase(newLang);
    Get.updateLocale(Locale(newLang == 'en' ? 'en' : 'es'));
  }
}
