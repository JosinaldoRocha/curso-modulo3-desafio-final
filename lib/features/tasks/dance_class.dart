import 'package:final_challenge/enums/task_enum.dart';
import 'package:final_challenge/interfaces/page_interface.dart';
import 'package:final_challenge/models/dance_class_model.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/read.dart';
import 'package:final_challenge/util/task_list.dart';

class DanceClass implements Page {
  @override
  void init() {
    Clean.screen();
    String name = Read.readString(message: 'Qual o nome da atividade?');
    String date = Read.readString(message: 'Data:');
    String place = Read.readString(message: 'Local:');
    double startTime =
        Read.readDouble(message: 'Horário de inicio da atividade:');
    double closingtime =
        Read.readDouble(message: 'Horário de encerramento da atividade:');
    String modality = Read.readString(message: 'Qual a modalidade da dança?');
    String dancerLevel = Read.readString(message: 'Nível da dança:');
    String danceGroupName =
        Read.readString(message: 'Qual o nome do seu grupo de dança?');

    DanceClassModel danceClass = DanceClassModel(
      name: name,
      date: date,
      startTime: startTime,
      closingtime: closingtime,
      taskShift: TaskShift.noturno,
      place: place,
      modality: modality,
      dancerLevel: dancerLevel,
      danceGroupName: danceGroupName,
    );

    taskList.add(danceClass);

    Clean.screen();
    print('-- Tarefa criada, com sucesso! --\n');

    danceClass.showTask();
  }
}
