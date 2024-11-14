import 'package:hive/hive.dart';
import 'package:productivity_app/task/data/database/local_database.dart';
import '../models/task_model.dart';

class TaskLocalDataSource {
  final Box<TaskModel> taskBox = LocalDatabase.getTaskBox();

  Future<void> addTask(TaskModel task) async =>
      await taskBox.put(task.id, task);

  Future<void> deleteTask(String taskId) async => await taskBox.delete(taskId);

  Future<void> updateTask(TaskModel task) async =>
      await taskBox.put(task.id, task);

  List<TaskModel> getTasks() => taskBox.values.toList();
}
