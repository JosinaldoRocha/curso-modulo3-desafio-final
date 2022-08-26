import 'package:final_challenge/features/create-task/create_task_menu.dart';
import 'package:final_challenge/features/delete-task/delete_task_menu.dart';
import 'package:final_challenge/features/run-tasks/run_tasks_menu.dart';
import 'package:final_challenge/features/see-tasks/see_tasks_menu.dart';
import 'package:final_challenge/interfaces/page_interface.dart';
import 'package:final_challenge/util/read.dart';

class Home implements Page {
  @override
  void init() {
    int option = 0;
    String name = Read.readString(
        message: 'Vem vindo à agenda de tarefas!\nQual o seu nome?');
    do {
      print('$name, escolha uma opção:');
      option = Read.readInt(
          message: '[1] Criar uma nova tarefa\n[2] Minhas tarefas\n'
              '[3] Executar tarefa\n[4] Excluir tarefa\n[5] Sair');

      if (option == 1) {
        CreateTaskMenu().init();
      } else if (option == 2) {
        SeeTasksMenu().init();
      } else if (option == 3) {
        RunTasks().init();
      } else if (option == 4) {
        DeleteTaskMenu().init();
      }
    } while (option != 5);
    print('\nSegue o líder!');
  }
}
