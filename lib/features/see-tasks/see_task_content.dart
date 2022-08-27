import 'package:final_challenge/interfaces/page_interface.dart';
import 'package:final_challenge/interfaces/task_interface.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/task_list.dart';

class SeeTaskContent implements Page {
  @override
  void init() {
    Clean.screen();
    print('-- Minhas Tarefas --');
    final taskList = TaskList().getAll();
    for (int i = 0; i < taskList.length; i++) {
      TasksInterface currentTask = taskList[i];

      print('\nCódigo: ${i + 1}');
      currentTask.showTask();
      print('Atividade concluída: ${currentTask.completed ? "Sim" : "Não"}');
    }
    print('');
  }
}
