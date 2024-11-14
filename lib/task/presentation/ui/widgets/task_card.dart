// lib/presentation/widgets/task_card.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productivity_app/core/routes/app_routes.dart';
import 'package:productivity_app/task/domain/entites/task_entity.dart';
import 'package:productivity_app/task/presentation/controllers/task_controller.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskController>();

    return Card(
      child: ListTile(
        title: Text(
          task.title,
          style: const TextStyle(fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.description,
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(border: Border.all()),
              child: Text(
                task.category,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        trailing: Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            controller.toggleTaskCompletion(task);
          },
        ),
        onTap: () {
          controller.toUpdateTasks.value = task;
          Get.toNamed(taskFormRoute);
        },
      ),
    );
  }
}
