import 'package:final_challenge/interfaces/page_interface.dart';
import 'package:final_challenge/models/other_tasks.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/read.dart';
import 'package:final_challenge/util/task_list.dart';

class OtherTasks implements Page {
  @override
  void init() {
    Clean.screen();
    String name = Read.readString(message: 'Qual o nome da atividade?');
    String date = Read.readString(message: 'Data:');
    String place = Read.readString(message: 'Local:');
    double startTime =
        Read.readDouble(message: 'Horário de início da atividade:');
    double closingtime =
        Read.readDouble(message: 'Horário de encerramento da atividade:');

    OtherTaskModel otherTasks = OtherTaskModel(
      name: name,
      date: date,
      place: place,
      startTime: startTime,
      closingtime: closingtime,
    );

    TaskList().addTask(otherTasks);

    Clean.screen();
    print('-- Tarefa criada, com sucesso! --\n');

    otherTasks.showTask();
  }
}
