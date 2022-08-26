import 'package:final_challenge/features/run-tasks/run_tasks_menu.dart';
import 'package:final_challenge/features/see-tasks/see_task_content.dart';
import 'package:final_challenge/features/see-tasks/see_task_title.dart';
import 'package:final_challenge/interfaces/page_interface.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/read.dart';
import 'package:final_challenge/util/task_list.dart';

class SeeTasksMenu implements Page {
  @override
  void init() {
    Clean.screen();
    if (taskList.isNotEmpty) {
      SeeTaskTitle().init();

      String seeTasksContent =
          Read.readString(message: 'Ver conteúdo das tarefas? s/n');

      Clean.screen();
      if (seeTasksContent == "s") {
        SeeTaskContent().init();
      }

      int option =
          Read.readInt(message: '[1] Executar uma tarefa   [2] Voltar');

      if (option == 1) {
        RunTasks().init();
      }
    } else {
      print('\nVocê não possue tarefas cadastradas!\n');
    }
  }
}
