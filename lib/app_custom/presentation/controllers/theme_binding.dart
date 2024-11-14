import 'package:get/get.dart';
import 'package:productivity_app/app_custom/data/repository/theme_repository.dart';
import 'package:productivity_app/app_custom/domain/usecases/get_theme_usecase.dart';
import 'package:productivity_app/app_custom/domain/usecases/update_theme_usecase.dart';
import 'package:productivity_app/app_custom/presentation/controllers/theme_controller.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    final themeRepository = ThemeRepositoryImpl();

    Get.lazyPut(() => GetThemeUseCase(themeRepository));
    Get.lazyPut(() => UpdateThemeUseCase(themeRepository));

    Get.lazyPut<ThemeController>(() => ThemeController(
        getThemeUseCase: Get.find(), updateThemeUseCase: Get.find()));
  }
}
