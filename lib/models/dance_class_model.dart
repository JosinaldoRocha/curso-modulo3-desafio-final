import 'package:final_challenge/enums/task_enum.dart';
import 'package:final_challenge/interfaces/task_interface.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/read.dart';

class DanceClassModel implements TasksInterface {
  DanceClassModel({
    required this.name,
    required this.date,
    required this.startTime,
    required this.closingtime,
    required this.taskShift,
    required this.place,
    required this.modality,
    required this.dancerLevel,
    required this.danceGroupName,
    this.maximumEnergy = 100,
    this.maximumDancerQuality = 100,
  });

  String modality;
  String dancerLevel;
  String danceGroupName;

  int maximumDancerQuality;
  int maximumEnergy;

  double _duration = 0;
  int _newDancePass = 0;
  int _myEnergy = 0;
  int _dancerQuality = 10;

  void _correctNegativeQuality() {
    if (_dancerQuality <= 0) {
      _dancerQuality = 0;
      print('Sua qualidade como dançarino(a): $_dancerQuality');
    } else {
      print('Sua qualidade como dançarino(a): $_dancerQuality');
    }
  }

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

  void _changeDancerQuality(int quality) {
    _dancerQuality += quality;
  }

  void _correctPositiveQuality() {
    if (_dancerQuality >= maximumDancerQuality) {
      _dancerQuality = maximumDancerQuality;
      print('Sua qualidade como dançarino(a): $_dancerQuality');
    } else {
      print('Sua qualidade como dançarino(a): $_dancerQuality');
    }
  }

  void seeDancerLevel() {
    if (_dancerQuality <= 30) {
      dancerLevel = "Iniciante";
      print('Você está no nível: $dancerLevel');
    } else if (_dancerQuality > 30 && _dancerQuality <= 70) {
      dancerLevel = "Intermediário";
      print('Você está no nível: $dancerLevel');
    } else if (_dancerQuality > 70) {
      dancerLevel = "Profissional";
      print('Você está no nível: $dancerLevel');
    }
  }

  void trainingPasses() {
    _changeMyEnergy(-10);
    _correctNegativeEnergy();
    _changeDancerQuality(15);
    _correctPositiveQuality();
  }

  void isNotTrainingdance() {
    _changeMyEnergy(5);
    _correctPositiveEnergy();
    _changeDancerQuality(-5);
    _correctNegativeQuality();
  }

  void studyingDance() {
    _changeMyEnergy(-3);
    _correctNegativeEnergy();
    _changeDancerQuality(10);
    _correctPositiveQuality();
  }

  void isNotStudying() {
    _changeMyEnergy(5);
    _correctPositiveEnergy();
    _changeDancerQuality(-10);
    _correctNegativeQuality();
  }

  void drinkWater() {
    _changeMyEnergy(25);
    _correctPositiveEnergy();
    print('Sua qualidade como dançarino(a): $_dancerQuality');
  }

  void resting() {
    _changeMyEnergy(80);
    _correctPositiveEnergy();
    _changeDancerQuality(70);
    _correctPositiveQuality();
  }

  void newPass() {
    _newDancePass += 1;
    _changeMyEnergy(-5);
    _correctNegativeEnergy();
    _changeDancerQuality(8);
    _correctPositiveQuality();
  }

  void learnedPasses() {
    print('$_newDancePass passe(s) aprendido(s).');
  }

  void dancePerformance() {
    _changeMyEnergy(-20);
    _correctNegativeEnergy();
    _changeDancerQuality(30);
    _correctPositiveQuality();
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
  void finishTask() {
    completeTask = "s";
    print('\nAtividade concluída!');
    learnedPasses();
    taskDuration();
    print('Sua energia: $_myEnergy');
    print('Sua qualidade como dançarino(a): $_dancerQuality');
    shift();
    seeDancerLevel();
  }

  @override
  void showTask() {
    print(
      'Nome da atividade: $name\n'
      'Data: $date\n'
      'Local: $place\n'
      'Horário de inicio: ${startTime.toStringAsFixed(2)}\n'
      'Horário de encerramento: ${closingtime.toStringAsFixed(2)}\n'
      'Turno: ${taskShift.name}\n'
      'Modalidade da dança: $modality\n'
      'Nívek da dança: $dancerLevel\n'
      'Nome do seu grupo de dança: $danceGroupName\n',
    );
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
  TaskType taskType = TaskType.danca;

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
          message:
              '[1] Estudando dança\n[2] Treinar passes\n[3] Pausa para distração\n'
              '[4] Parar de treinar passes\n[5] Fazer uma apresentação\n[6] Beber água\n'
              '[7] Descansar\n[8] Aprender novo passe\n[9] Ver todos os passes aprendidos\n'
              '[10] Ver meu nível como dançarino\n[11] Finalizar atividade');

      Clean.screen();
      if (option == 1) {
        studyingDance();
      } else if (option == 2) {
        trainingPasses();
      } else if (option == 3) {
        isNotStudying();
      } else if (option == 4) {
        isNotTrainingdance();
      } else if (option == 5) {
        dancePerformance();
      } else if (option == 6) {
        drinkWater();
      } else if (option == 7) {
        resting();
      } else if (option == 8) {
        newPass();
      } else if (option == 9) {
        learnedPasses();
      } else if (option == 10) {
        seeDancerLevel();
      } else if (option == 11) {
      } else {
        print('Opção inválida');
      }
    } while (option != 11);
    finishTask();
  }
}
