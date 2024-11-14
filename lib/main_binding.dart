import 'package:get/get.dart';
import 'package:productivity_app/app_custom/presentation/controllers/language_binding.dart';
import 'package:productivity_app/app_custom/presentation/controllers/theme_binding.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    ThemeBinding().dependencies();
    LanguageBinding().dependencies();
  }
}
