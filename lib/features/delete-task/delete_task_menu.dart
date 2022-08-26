import 'package:final_challenge/features/see-tasks/see_task_title.dart';
import 'package:final_challenge/interfaces/page_interface.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/read.dart';
import 'package:final_challenge/util/task_list.dart';

class DeleteTaskMenu implements Page {
  @override
  void init() {
    int option = 1;
    do {
      Clean.screen();
      if (taskList.isNotEmpty) {
        SeeTaskTitle().init();

        deleteTask();
      } else {
        print('\nNão há tarefas para excluir!\n');
      }
      option = Read.readInt(message: '[1] Excluir outra tarefa     [2] Voltar');
    } while (option == 1);
  }
}

void deleteTask() {
  int code =
      Read.readInt(message: 'Digite o código da tarefa que você quer excluir:');

  Clean.screen();
  if (code > 0 && code <= taskList.length) {
    if (taskList[code - 1].completed == false) {
      String delete = Read.readString(
          message:
              'Você ainda não concluiu essa atividade. Deseja exlcuir, mesmo assim? s/n');
      if (delete == "s") {
        taskList.removeAt(code - 1);
        print('\nAtividade excluída, com sucesso!\n');
      }
    } else {
      taskList.removeAt(code - 1);
      print('\nAtividade excluída, com sucesso!\n');
    }
  } else {
    print('\nCódigo de tarefas inválido!\n');
  }
}
