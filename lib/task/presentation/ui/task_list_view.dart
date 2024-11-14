// lib/presentation/views/task_list_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productivity_app/app_custom/presentation/controllers/language_controller.dart';
import 'package:productivity_app/app_custom/presentation/controllers/theme_controller.dart';
import 'package:productivity_app/core/routes/app_routes.dart';
import 'package:productivity_app/core/utils/consts/string_const.dart';
import 'package:productivity_app/generated/locales.g.dart';
import '../controllers/task_controller.dart';
import 'widgets/task_card.dart';

class TaskListView extends StatelessWidget {
  final TaskController taskController = Get.find<TaskController>();
  final ThemeController themeController = Get.find<ThemeController>();
  final LanguageController languageController = Get.find<LanguageController>();

  TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title.tr),
        actions: [
          Obx(() => IconButton(
                icon: Icon(themeController.isDarkTheme.value
                    ? Icons.brightness_7_rounded
                    : Icons.brightness_4_outlined),
                onPressed: () {
                  themeController.toggleTheme();
                },
              )),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              languageController.toggleLanguage();
            },
          ),
        ],
      ),
      body: Obx(() {
        return taskController.tasks.isNotEmpty
            ? ListView.builder(
                itemCount: taskController.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskController.tasks[index];
                  return TaskCard(task: task);
                },
              )
            : const Center(
                child: Text(
                StringConst.noTaskFound,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(taskFormRoute),
        child: const Icon(Icons.add),
      ),
    );
  }
}
