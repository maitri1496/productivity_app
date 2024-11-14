import 'package:productivity_app/task/domain/entites/task_entity.dart';
import 'package:productivity_app/task/domain/repository/task_repository.dart';

class GetTasksUseCase {
  final TaskRepository repository;

  GetTasksUseCase(this.repository);

  Future<List<TaskEntity>> call() async {
    return await repository.getTasks();
  }
}
