import 'package:get/get.dart';
import 'package:productivity_app/app_custom/data/repository/language_repository.dart';
import 'package:productivity_app/app_custom/domain/usecases/get_language_usecase.dart';
import 'package:productivity_app/app_custom/domain/usecases/update_language_usecase.dart';
import 'package:productivity_app/app_custom/presentation/controllers/language_controller.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    final languageRepository = LanguageRepositoryImpl();

    Get.lazyPut(() => GetLanguageUseCase(languageRepository));
    Get.lazyPut(() => UpdateLanguageUseCase(languageRepository));

    Get.lazyPut<LanguageController>(() => LanguageController(
        getLanguageUseCase: Get.find(), updateLanguageUseCase: Get.find()));
  }
}
