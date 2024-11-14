import 'package:get/get.dart';
import 'package:productivity_app/task/data/repository/task_local_data_source.dart';
import 'package:productivity_app/task/data/repository/task_repository_impl.dart';
import 'package:productivity_app/task/domain/usecases/add_task_usecase.dart';
import 'package:productivity_app/task/domain/usecases/delete_task_usecase.dart';
import 'package:productivity_app/task/domain/usecases/edit_task_usecase.dart';
import 'package:productivity_app/task/domain/usecases/get_task_usecase.dart';
import 'package:productivity_app/task/presentation/controllers/task_controller.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {

    final taskLocalDataSource = TaskLocalDataSource();
    final taskRepository = TaskRepositoryImpl(taskLocalDataSource);

    Get.lazyPut(() => AddTaskUseCase(taskRepository));
    Get.lazyPut(() => EditTaskUseCase(taskRepository));
    Get.lazyPut(() => GetTasksUseCase(taskRepository));
    Get.lazyPut(() => DeleteTaskUseCase(taskRepository));

    Get.lazyPut<TaskController>(() => TaskController(
        addTaskUseCase: Get.find(),
        getTasksUseCase: Get.find(),
        deleteTaskUseCase: Get.find(),
        editTaskUseCase: Get.find()));


  }
}
