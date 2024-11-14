import 'package:productivity_app/task/domain/entites/task_entity.dart';

abstract class TaskRepository {
  Future<void> addTask(TaskEntity task);

  Future<void> deleteTask(String taskId);

  Future<void> updateTask(TaskEntity task);

  Future<List<TaskEntity>> getTasks();
}
