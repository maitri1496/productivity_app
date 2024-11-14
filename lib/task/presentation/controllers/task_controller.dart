import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:productivity_app/core/utils/consts/string_const.dart';
import 'package:productivity_app/task/domain/entites/task_entity.dart';
import 'package:productivity_app/task/domain/usecases/add_task_usecase.dart';
import 'package:productivity_app/task/domain/usecases/delete_task_usecase.dart';
import 'package:productivity_app/task/domain/usecases/edit_task_usecase.dart';
import 'package:productivity_app/task/domain/usecases/get_task_usecase.dart';

class TaskController extends GetxController {
  final AddTaskUseCase addTaskUseCase;
  final EditTaskUseCase editTaskUseCase;
  final GetTasksUseCase getTasksUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;

  RxList<TaskEntity> tasks = <TaskEntity>[].obs;
  Rxn<TaskEntity> toUpdateTasks = Rxn();

  var isLoading = false.obs;

  TaskController({
    required this.addTaskUseCase,
    required this.editTaskUseCase,
    required this.getTasksUseCase,
    required this.deleteTaskUseCase,
  });

  @override
  Future<void> onInit() async {
    super.onInit();
    loadTasks();
  }

  void loadTasks() async {
    isLoading.value = true;
    try {
      final taskList = await getTasksUseCase();
      tasks.assignAll(taskList);
    } catch (e) {
      debugPrint("${StringConst.errorLoadTask} $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addTask(TaskEntity task) async {
    try {
      await addTaskUseCase(task);
      tasks.add(task);
    } catch (e) {
      debugPrint("${StringConst.errorAddTask} $e");
    }
  }

  Future<void> editTask(TaskEntity task) async {
    try {
      final updatedTask = TaskEntity(
        id: task.id,
        title: task.title,
        description: task.description,
        dueDate: task.dueDate,
        priority: task.priority,
        isCompleted: task.isCompleted,
        category: task.category,
      );
      await editTaskUseCase(updatedTask);
      final index = tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        tasks[index] = updatedTask;
      }
    } catch (e) {
      debugPrint("${StringConst.errorAddTask} $e");
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await deleteTaskUseCase(taskId);
      tasks.removeWhere((task) => task.id == taskId);

    } catch (e) {
      debugPrint("${StringConst.errorDeleteTask} $e");
    }
  }

  Future<void> toggleTaskCompletion(TaskEntity task) async {
    try {
      final updatedTask = TaskEntity(
        id: task.id,
        title: task.title,
        description: task.description,
        dueDate: task.dueDate,
        priority: task.priority,
        isCompleted: !task.isCompleted,
        category: task.category,
      );
      await addTaskUseCase(updatedTask);
      final index = tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        tasks[index] = updatedTask;
      }
    } catch (e) {
      debugPrint("${StringConst.errorUpdateTask} $e");
    }
  }

  void refreshTasks() => loadTasks();
}
