import 'package:productivity_app/task/domain/entites/task_entity.dart';
import 'package:productivity_app/task/domain/repository/task_repository.dart';

class EditTaskUseCase {
  final TaskRepository repository;

  EditTaskUseCase(this.repository);

  Future<void> call(TaskEntity task) async {
    await repository.updateTask(task);
  }
}
