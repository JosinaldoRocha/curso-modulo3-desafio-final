import 'package:final_challenge/interfaces/page_interface.dart';
import 'package:final_challenge/models/camping_model.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/read.dart';
import 'package:final_challenge/util/task_list.dart';

class Camping implements Page {
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
    int numberOfParticipants =
        Read.readInt(message: 'Quantidade de participantes');

    CampingModel camping = CampingModel(
      name: name,
      date: date,
      place: place,
      startTime: startTime,
      closingtime: closingtime,
      numberOfParticipants: numberOfParticipants,
    );

    TaskList().addTask(camping);

    Clean.screen();
    print('-- Tarefa criada, com sucesso! --\n');

    camping.showTask();
  }
}
