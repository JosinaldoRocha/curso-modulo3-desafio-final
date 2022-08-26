import 'package:final_challenge/interfaces/page_interface.dart';
import 'package:final_challenge/interfaces/task_interface.dart';
import 'package:final_challenge/models/camping_model.dart';
import 'package:final_challenge/models/dance_class_model.dart';
import 'package:final_challenge/models/music_class_model.dart';
import 'package:final_challenge/models/other_tasks.dart';
import 'package:final_challenge/models/play_soccer_model.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/task_list.dart';

class SeeTaskTitle implements Page {
  @override
  void init() {
    Clean.screen();
    print('-- Minhas Tarefas --');
    for (int i = 0; i < taskList.length; i++) {
      TasksInterface currentTask = taskList[i];
      currentTask.taskcompleted();
      print('\nCódigo: ${i + 1}');

      if (currentTask is PlaySoccerModel) {
        print('Atividade: ${currentTask.name}');
      }
      if (currentTask is DanceClassModel) {
        print('Atividade: ${currentTask.name}');
      }
      if (currentTask is MusicClassModel) {
        print('Atividade: ${currentTask.name}');
      }
      if (currentTask is CampingModel) {
        print('Atividade: ${currentTask.name}');
      }
      if (currentTask is OtherTaskModel) {
        print('Atividade: ${currentTask.name}');
      }
      print('Tipo de atividade: ${currentTask.taskType.name}');
      print('Atividade concluída: ${currentTask.completed ? "Sim" : "Não"}');
    }
    print('');
  }
}
