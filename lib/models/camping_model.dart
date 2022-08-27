import 'package:final_challenge/enums/task_enum.dart';
import 'package:final_challenge/interfaces/task_interface.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/read.dart';

class CampingModel implements TasksInterface {
  CampingModel({
    required this.name,
    required this.date,
    required this.place,
    required this.startTime,
    required this.closingtime,
    required this.numberOfParticipants,
    this.maximumEnergy = 100,
    this.maximumCampingExperience = 100,
  });

  int numberOfParticipants;

  int maximumEnergy;
  int maximumCampingExperience;

  double _duration = 0;
  int _myEnergy = 50;
  int _campingExperience = 0;

  void _changeCampingExperience(int experience) {
    _campingExperience += experience;
  }

  void _correctPositiveExperience() {
    if (_campingExperience >= maximumCampingExperience) {
      _campingExperience = maximumCampingExperience;
      print('Seus pontos de experiência em acampamento: $_campingExperience');
    } else {
      print('Seus pontos de experiência em acampamento: $_campingExperience');
    }
  }

  void _correctNegativeExperience() {
    if (_campingExperience <= 0) {
      _campingExperience = 0;
      print('Seus pontos de experiência em acampamento: $_campingExperience');
    } else {
      print('Seus pontos de experiência em acampamento: $_campingExperience');
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

  void cleanCampsite() {
    _changeMyEnergy(-10);
    _correctNegativeEnergy();
    _changeCampingExperience(10);
    _correctPositiveExperience();
  }

  void setUpCamp() {
    _changeMyEnergy(-10);
    _correctNegativeEnergy();
    _changeCampingExperience(15);
    _correctPositiveExperience();
  }

  void prepareLunch() {
    _changeMyEnergy(-5);
    _correctNegativeEnergy();
    _changeCampingExperience(5);
    _correctPositiveExperience();
  }

  void prepareDinner() {
    _changeMyEnergy(-5);
    _correctNegativeEnergy();
    _changeCampingExperience(5);
    _correctPositiveExperience();
  }

  void goOutHunting() {
    _changeMyEnergy(-15);
    _correctNegativeEnergy();
    _changeCampingExperience(20);
    _correctPositiveExperience();
  }

  void drinkWater() {
    _changeMyEnergy(25);
    _correctPositiveEnergy();
  }

  void resting() {
    _changeMyEnergy(80);
    _correctPositiveEnergy();
  }

  void funMoment() {
    _changeMyEnergy(-25);
    _correctNegativeEnergy();
    _changeCampingExperience(20);
    _correctPositiveExperience();
  }

  void toSleep() {
    _changeMyEnergy(maximumEnergy);
    _correctPositiveEnergy();
    _changeCampingExperience(20);
    _correctPositiveExperience();
  }

  void wasteFood() {
    _changeCampingExperience(30);
    _correctNegativeExperience();
  }

  void burntFood() {
    _changeCampingExperience(20);
    _correctNegativeExperience();
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
    print('Seus pontos de atividade durou: $_duration horas');
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
        'Quantidade de participantes: $numberOfParticipants\n'
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
    print('Seus pontos de experiência em acampamento: $_campingExperience');
    shift();
  }

  @override
  void runTask() {
    int option = 0;
    do {
      print('Escolha uma ação');
      option = Read.readInt(
          message:
              '[1] Limpar local\n[2] Levantar acampamento\n[3] Preparar o almoço\n'
              '[4] Preparar o jantar\n[5] Sair para caçar\n[6] Beber água\n'
              '[7] Descansar\n[8] Momento de diversão\n[9] Jogar comida fora\n'
              '[10] Esqueci a carne no fogo\n[11] Dormir\n[12] Finalizar atividade');

      Clean.screen();
      if (option == 1) {
        cleanCampsite();
      } else if (option == 2) {
        setUpCamp();
      } else if (option == 3) {
        prepareLunch();
      } else if (option == 4) {
        prepareDinner();
      } else if (option == 5) {
        goOutHunting();
      } else if (option == 6) {
        drinkWater();
      } else if (option == 7) {
        resting();
      } else if (option == 8) {
        funMoment();
      } else if (option == 9) {
        wasteFood();
      } else if (option == 10) {
        burntFood();
      } else if (option == 11) {
        toSleep();
      } else if (option == 12) {
      } else {
        print('Opção inválida');
      }
    } while (option != 12);
    finishTask();
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
  TaskType taskType = TaskType.acampamento;
}
