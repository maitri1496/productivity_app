import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/app_custom/domain/usecases/get_theme_usecase.dart';
import 'package:productivity_app/app_custom/domain/usecases/update_theme_usecase.dart';
import 'package:productivity_app/core/theme/app_themes.dart';

class ThemeController extends GetxController {
  final GetThemeUseCase getThemeUseCase;
  final UpdateThemeUseCase updateThemeUseCase;

  RxBool isDarkTheme = false.obs;

  ThemeController(
      {required this.getThemeUseCase, required this.updateThemeUseCase});

  ThemeData get theme =>
      isDarkTheme.value ? AppThemes.darkTheme : AppThemes.lightTheme;

  @override
  void onInit() async {
    super.onInit();
    bool isDarkThemeStored = await getThemeUseCase();
    isDarkTheme.value = isDarkThemeStored;
    Get.changeTheme(theme);
  }

  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeTheme(theme);
    updateThemeUseCase(isDarkTheme.value);
  }
}
