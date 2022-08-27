import 'package:final_challenge/interfaces/task_interface.dart';

List<TasksInterface> _taskList = [];

class TaskList {
  List<TasksInterface> getAll() {
    return _taskList;
  }

  void addTask(TasksInterface task) {
    _taskList.add(task);
  }

  void deleteTask(int task) {
    _taskList.removeAt(task);
  }
}
