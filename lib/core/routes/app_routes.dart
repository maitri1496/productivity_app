import 'package:get/get.dart';
import 'package:productivity_app/task/presentation/ui/task_form_view.dart';
import 'package:productivity_app/task/presentation/ui/task_list_view.dart';

const taskFormRoute = "/taskForm";

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => TaskListView()),
    GetPage(name: taskFormRoute, page: () => TaskFormView()),
  ];
}
