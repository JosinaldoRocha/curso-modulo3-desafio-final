import 'package:final_challenge/interfaces/task_interface.dart';
import 'package:final_challenge/enums/task_enum.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/read.dart';

class PlaySoccerModel implements TasksInterface {
  PlaySoccerModel({
    required this.name,
    required this.startTime,
    required this.closingtime,
    required this.date,
    required this.place,
    required this.taskShift,
    required this.teamName,
    required this.position,
    required this.shirtNumber,
    this.maximumAthleteQuality = 100,
    this.maximumEnergy = 100,
  });

  String teamName;
  String position;
  int shirtNumber;
  int maximumAthleteQuality;

  int maximumEnergy;

  double _duration = 0;
  int _newGoal = 0;
  int _myEnergy = 0;
  int _athleteQuality = 50;

  void _correctNegativeQuality() {
    if (_athleteQuality <= 0) {
      _athleteQuality = 0;
      print('Sua qualidade como atleta: $_athleteQuality');
    } else {
      print('Sua qualidade como atleta: $_athleteQuality');
    }
  }

  void _correctNegativeEnergy() {
    if (_myEnergy <= 0) {
      _myEnergy = 0;
      print('Você está esgotado.');
      print('Sua energia: $_myEnergy');
    } else {
      print('Sua energia: $_myEnergy');
    }
  }

  void _correctPositiveEnergy() {
    if (_myEnergy >= maximumEnergy) {
      _myEnergy = maximumEnergy;
      print('Sua energia: $_myEnergy');
    } else {
      print('Sua energia: $_myEnergy');
    }
  }

  void _changeMyEnergy(int energy) {
    _myEnergy += energy;
  }

  void _changeAthleteQuality(int quality) {
    _athleteQuality += quality;
  }

  void _correctPositiveQuality() {
    if (_athleteQuality >= maximumAthleteQuality) {
      _athleteQuality = maximumAthleteQuality;
      print('Sua qualidade como atleta: $_athleteQuality');
    } else {
      print('Sua qualidade como atleta: $_athleteQuality');
    }
  }

  void running() {
    _changeMyEnergy(-20);
    _correctNegativeEnergy();
    _changeAthleteQuality(15);
    _correctPositiveQuality();
  }

  void corner() {
    _changeMyEnergy(-5);
    _correctNegativeEnergy();
    _changeAthleteQuality(5);
    _correctPositiveQuality();
  }

  void kick() {
    _changeMyEnergy(-8);
    _correctNegativeEnergy();
    _changeAthleteQuality(11);
    _correctPositiveQuality();
  }

  void takeAPenalty() {
    _changeMyEnergy(-5);
    _correctNegativeEnergy();
    _changeAthleteQuality(15);
    _correctPositiveQuality();
  }

  void drinkWater() {
    _changeMyEnergy(25);
    _correctPositiveEnergy();
    print('Sua qualidade como atleta: $_athleteQuality');
  }

  void resting() {
    _changeMyEnergy(80);
    _correctPositiveEnergy();
    _changeAthleteQuality(70);
    _correctPositiveQuality();
  }

  void newGoal() {
    _newGoal += 1;
    _changeMyEnergy(-7);
    _correctNegativeEnergy();
    _changeAthleteQuality(10);
    _correctPositiveQuality();
  }

  void goalscored() {
    print('$_newGoal gol(s) marcados.');
  }

  void isHurt() {
    _changeMyEnergy(maximumEnergy);
    _correctPositiveEnergy();
    _changeAthleteQuality(-50);
    _correctNegativeQuality();
  }

  @override
  void finishTask() {
    completeTask = "s";
    print('\nAtividade concluída!');
    goalscored();
    taskDuration();
    print('Sua energia: $_myEnergy');
    print('Sua qualidade como atleta: $_athleteQuality');
    shift();
  }

  @override
  void taskDuration() {
    _duration = closingtime - startTime;
    print('Sua atividade durou: $_duration horas');
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
        'Turno: ${taskShift.name}\n'
        'Nome do seu time: $teamName\n'
        'Posição tática: $position\n'
        'Número da camisa: $shirtNumber\n');
  }

  @override
  double closingtime;

  @override
  String date;

  @override
  String place;

  @override
  double startTime;

  @override
  TaskShift taskShift;

  @override
  TaskType taskType = TaskType.futebol;

  @override
  bool completed = false;

  @override
  String completeTask = "n";

  @override
  String name;

  @override
  void runTask() {
    int option = 0;
    do {
      print('Escolha uma ação');
      option = Read.readInt(
          message: '[1] Correr\n[2] Cobrar escanteio\n[3] cobrar pênalti\n'
              '[4] Marcar um gol\n[5] Chutar\n[6] Beber água\n[7] Descansar\n'
              '[8] Ver gols marcados\n[9] Jogador machucado\n[10] Finalizar atividade');

      Clean.screen();
      if (option == 1) {
        running();
      } else if (option == 2) {
        corner();
      } else if (option == 3) {
        takeAPenalty();
      } else if (option == 4) {
        newGoal();
      } else if (option == 5) {
        kick();
      } else if (option == 6) {
        drinkWater();
      } else if (option == 7) {
        resting();
      } else if (option == 8) {
        goalscored();
      } else if (option == 9) {
        isHurt();
      } else if (option == 10) {
      } else {
        print('Opção inválida');
      }
    } while (option != 10);
    finishTask();
  }
}
