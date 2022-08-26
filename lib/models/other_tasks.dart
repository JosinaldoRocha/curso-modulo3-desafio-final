import 'package:final_challenge/interfaces/task_interface.dart';
import 'package:final_challenge/enums/task_enum.dart';

class OtherTaskModel implements TasksInterface {
  OtherTaskModel({
    required this.name,
    required this.date,
    required this.place,
    required this.startTime,
    required this.closingtime,
    this.maximumEnergy = 100,
  });

  int maximumEnergy;

  double _duration = 0;
  int _myEnergy = 50;

  void _correctNegativeEnergy() {
    if (_myEnergy <= 0) {
      _myEnergy = 0;
      print('Você está esgotado.');
      print('Quantidade de energia: $_myEnergy');
    } else {
      print('Quantidade de energia: $_myEnergy');
    }
  }

  void _correctPositiveEnergy() {
    if (_myEnergy >= maximumEnergy) {
      _myEnergy = maximumEnergy;
      print('Quantidade de energia: $_myEnergy');
    } else {
      print('Quantidade de energia: $_myEnergy');
    }
  }

  void _changeMyEnergy(int energy) {
    _myEnergy += energy;
  }

  void drinkWater() {
    _changeMyEnergy(25);
    _correctPositiveEnergy();
  }

  void interacting() {
    _changeMyEnergy(-20);
    _correctNegativeEnergy();
  }

  @override
  void shift() {
    if (startTime >= 6 && startTime < 17.59) {
      taskShift = TaskShift.diurno;
      print('Turno da atividade: ${taskShift.name}');
    } else {
      taskShift = TaskShift.noturno;
      print('Turno da atividade: ${taskShift.name}');
    }
  }

  @override
  void taskDuration() {
    _duration = closingtime - startTime;
    print('Sua atividade durou: $_duration horas');
  }

  @override
  void taskcompleted() {
    if (completeTask == "s") {
      completed = true;
    } else {
      completed = false;
    }
  }

  @override
  void showTask() {
    print('Nome da atividade: $name\n'
        'Data: $date\n'
        'Local: $place\n'
        'Horário de inicio: ${startTime.toStringAsFixed(2)}\n'
        'Horário de encerramento: ${closingtime.toStringAsFixed(2)}\n'
        'Turno: ${taskShift.name}\n');
  }

  @override
  void finishTask() {
    completeTask = "s";
    print('\nAtividade concluída!');
    taskDuration();
    print('Sua energia: $_myEnergy');
    //print('Sua qualidade como músico/musicista: $_musicianQuality');
    shift();
  }

  @override
  double closingtime;

  @override
  String completeTask = "n";

  @override
  bool completed = false;

  @override
  String date;

  @override
  String name;

  @override
  String place;

  @override
  double startTime;

  @override
  TaskShift taskShift = TaskShift.diurno;

  @override
  TaskType taskType = TaskType.outra;
}
