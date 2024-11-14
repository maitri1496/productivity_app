import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:productivity_app/core/utils/consts/string_const.dart';
import '../models/task_model.dart';

class LocalDatabase {
  static const String taskBoxName = StringConst.taskBoxName;

  static Future<void> initializeHive() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(TaskModelAdapter());
    await Hive.openBox<TaskModel>(taskBoxName);
  }

  static Box<TaskModel> getTaskBox() => Hive.box<TaskModel>(taskBoxName);
}
