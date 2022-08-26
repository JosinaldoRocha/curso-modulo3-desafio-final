import 'package:final_challenge/features/tasks/camping.dart';
import 'package:final_challenge/features/tasks/dance_class.dart';
import 'package:final_challenge/features/tasks/music_class.dart';
import 'package:final_challenge/features/tasks/other_tasks.dart';
import 'package:final_challenge/interfaces/page_interface.dart';
import 'package:final_challenge/features/tasks/play_soccer.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/read.dart';

class CreateTaskMenu implements Page {
  @override
  void init() {
    int option = 1;
    do {
      Clean.screen();
      print('Qual tipo de tarefa você deseja criar?');
      option = Read.readInt(
          message: '[1] Jogar futebol\n[2] Aula de dança\n[3] Aula de música\n'
              '[4] Acampamento\n[5] Outra atividade');

      if (option == 1) {
        PlaySoccer().init();
      } else if (option == 2) {
        DanceClass().init();
      } else if (option == 3) {
        MusicClass().init();
      } else if (option == 4) {
        Camping().init();
      } else if (option == 5) {
        OtherTasks().init();
      } else {
        print('\nOpção inválida!');
      }
      Clean.screen();
      option =
          Read.readInt(message: '[1] Criar uma nova tarefa     [2] Voltar');
    } while (option == 1);
    Clean.screen();
  }
}
