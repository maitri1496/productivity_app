import 'package:productivity_app/task/domain/entites/task_entity.dart';
import 'package:productivity_app/task/domain/repository/task_repository.dart';

import '../models/task_model.dart';
import 'task_local_data_source.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTask(TaskEntity task) async {
    final taskModel = TaskModel.fromEntity(task);
    await localDataSource.addTask(taskModel);
  }

  @override
  Future<void> deleteTask(String taskId) async {
    await localDataSource.deleteTask(taskId);
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    final tasks = localDataSource.getTasks();
    return tasks.map((taskModel) => taskModel.toEntity()).toList();
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    final taskModel = TaskModel.fromEntity(task);
    await localDataSource.updateTask(taskModel);
  }
}
