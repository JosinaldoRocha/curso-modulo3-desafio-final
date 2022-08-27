import 'package:final_challenge/enums/task_enum.dart';

abstract class TasksInterface {
  late String name;
  late TaskType taskType;
  late String place;
  late String date;
  late double startTime;
  late double closingtime;
  late TaskShift taskShift;
  late bool completed;
  late String completeTask;

  void taskDuration() {}
  void shift() {}
  void taskcompleted() {}
  void showTask() {}
  void finishTask() {}
  void runTask() {}
}
