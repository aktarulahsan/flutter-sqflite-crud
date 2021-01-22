import 'package:flutter_crud/database/db_helper.dart';

import 'package:flutter_crud/model/task.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {

  @override
  void onReady() {
    getTasks();
    super.onReady();
  }
  final taskList = List<Task>().obs;

  //for  add data to table
  Future<void> addTask({Task task}) async {
    return await DBHelper.insert(task);
  }

  //for  get all the data from table
  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }

//for  delete data from table
  void deleteTask(Task task) async {
    await DBHelper.delete(task);
    getTasks();
  }

// for update data int table
  void markTaskCompleted(int id) async {
    await DBHelper.update(id);
    getTasks();
  }


}