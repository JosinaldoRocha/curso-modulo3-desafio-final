import 'package:final_challenge/features/see-tasks/see_task_title.dart';
import 'package:final_challenge/interfaces/page_interface.dart';
import 'package:final_challenge/interfaces/task_interface.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/read.dart';
import 'package:final_challenge/util/task_list.dart';

class RunTasks implements Page {
  @override
  void init() {
    int option = 1;
    do {
      Clean.screen();
      final taskList = TaskList().getAll();
      if (taskList.isNotEmpty) {
        SeeTaskTitle().init();

        _runTaskMenu();
      } else {
        print('\nNão há tarefas para executar!\n');
      }

      option =
          Read.readInt(message: '[1] Executar uma nova tarefa     [2] Voltar');
    } while (option == 1);
    Clean.screen();
  }

  void _runTaskMenu() {
    int code = Read.readInt(
        message: 'Digite o código da tarefa que você quer executar:');
    Clean.screen();
    final taskList = TaskList().getAll();
    if (code > 0 && code <= taskList.length) {
      if (!taskList[code - 1].completed) {
        TasksInterface currentTask = taskList[code - 1];

        currentTask.runTask();

        print('');
      } else {
        print('\nVocê já concluiu essa atividade, anteriormente.\n'
            'Escolha uma atividade, não concluída, para executar!\n');
      }
    } else {
      print('\nCódigo de tarefas inválido!\n');
    }
  }
}
