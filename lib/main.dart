import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:productivity_app/app_custom/presentation/controllers/theme_controller.dart';
import 'package:productivity_app/core/routes/app_routes.dart';
import 'package:productivity_app/core/utils/consts/string_const.dart';
import 'package:productivity_app/generated/locales.g.dart';
import 'package:productivity_app/main_binding.dart';
import 'package:productivity_app/task/data/database/local_database.dart';
import 'package:productivity_app/task/presentation/controllers/task_binding.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await LocalDatabase.initializeHive();

  MainBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: StringConst.appName,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        initialBinding: TaskBinding(),
        theme: Get.find<ThemeController>().theme,
        locale: Get.locale,
        fallbackLocale: const Locale('en', 'US'),
        translationsKeys: AppTranslation.translations,
        getPages: AppRoutes.routes);
  }
}
