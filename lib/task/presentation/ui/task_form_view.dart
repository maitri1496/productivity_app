import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productivity_app/generated/locales.g.dart';
import 'package:productivity_app/task/domain/entites/task_entity.dart';
import 'package:productivity_app/task/presentation/controllers/task_controller.dart';

class TaskFormView extends StatelessWidget {
  final TaskController controller = Get.find();
  final TextEditingController categoryController =
      TextEditingController(text: 'Work');
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  TaskFormView({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.toUpdateTasks.value != null) {
      categoryController.text =
          controller.toUpdateTasks.value?.category ?? 'Work';
      titleController.text = controller.toUpdateTasks.value?.title ?? '';
      descriptionController.text =
          controller.toUpdateTasks.value?.description ?? '';
    }
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        controller.toUpdateTasks.value = null;
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(controller.toUpdateTasks.value != null
                ? LocaleKeys.editTask.tr
                : LocaleKeys.addTask.tr)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: LocaleKeys.title.tr,
                      border: const OutlineInputBorder())),
              const SizedBox(height: 24),
              TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: LocaleKeys.description.tr,
                      border: const OutlineInputBorder())),
              const SizedBox(height: 24),
              TextField(
                  controller: categoryController,
                  decoration: InputDecoration(
                      labelText: LocaleKeys.category.tr,
                      border: const OutlineInputBorder())),
              const SizedBox(height: 20),
              controller.toUpdateTasks.value != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (controller.toUpdateTasks.value != null) {
                              TaskEntity tempTask =
                                  controller.toUpdateTasks.value!.copyWith(
                                title: titleController.text,
                                description: descriptionController.text,
                                category: categoryController.text,
                              );
                              controller.editTask(tempTask);
                            }
                            controller.toUpdateTasks.value = null;
                            Get.back();
                          },
                          child: Text(
                            LocaleKeys.update.tr,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller
                                .deleteTask(controller.toUpdateTasks.value!.id);
                            controller.toUpdateTasks.value = null;
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent.shade100),
                          child: Text(
                            LocaleKeys.delete.tr,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () {
                        final newTask = TaskEntity(
                          id: DateTime.now().toString(),
                          title: titleController.text,
                          description: descriptionController.text,
                          dueDate: DateTime.now(),
                          priority: 1,
                          category: categoryController.text,
                        );
                        controller.addTask(newTask);

                        Get.back();
                      },
                      child: Text(
                        LocaleKeys.save.tr,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
