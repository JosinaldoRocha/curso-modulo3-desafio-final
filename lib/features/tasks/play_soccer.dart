import 'package:final_challenge/enums/task_enum.dart';
import 'package:final_challenge/interfaces/page_interface.dart';
import 'package:final_challenge/models/play_soccer_model.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/read.dart';
import 'package:final_challenge/util/task_list.dart';

class PlaySoccer implements Page {
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
    String teamName = Read.readString(message: 'Nome do seu time:');
    String position = Read.readString(message: 'Sua posição no time:');
    int shirtNumber = Read.readInt(message: 'Número da sua camisa:');

    PlaySoccerModel playSoccer = PlaySoccerModel(
      name: name,
      date: date,
      place: place,
      startTime: startTime,
      closingtime: closingtime,
      taskShift: TaskShift.diurno,
      teamName: teamName,
      position: position,
      shirtNumber: shirtNumber,
    );

    taskList.add(playSoccer);

    Clean.screen();
    print('-- Tarefa criada, com sucesso! --\n');

    playSoccer.showTask();
  }
}
