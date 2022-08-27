import 'package:final_challenge/interfaces/page_interface.dart';
import 'package:final_challenge/models/music_class_model.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/read.dart';
import 'package:final_challenge/util/task_list.dart';

class MusicClass implements Page {
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
    String instrumentType = Read.readString(
        message:
            'Tipo de instrumento? \ncordas\nsopro\npercussão\nvoz\noutros');
    String instrument =
        Read.readString(message: 'Qual instrumento você está estudando?');
    String courseLevel = Read.readString(message: 'Nível do curso:');

    MusicClassModel musicClass = MusicClassModel(
      name: name,
      date: date,
      place: place,
      startTime: startTime,
      closingtime: closingtime,
      instrument: instrument,
      instrumentType: instrumentType,
      courseLevel: courseLevel,
    );

    TaskList().addTask(musicClass);

    Clean.screen();
    print('-- Tarefa criada, com sucesso! --\n');

    musicClass.showTask();
  }
}
