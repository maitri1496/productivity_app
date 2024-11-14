import 'package:productivity_app/task/domain/entites/task_entity.dart';
import 'package:productivity_app/task/domain/repository/task_repository.dart';

class AddTaskUseCase {
  final TaskRepository repository;

  AddTaskUseCase(this.repository);

  Future<void> call(TaskEntity task) async {
    await repository.addTask(task);
  }
}
