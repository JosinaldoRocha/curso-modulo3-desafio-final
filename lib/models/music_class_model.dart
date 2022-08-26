import 'package:final_challenge/enums/task_enum.dart';
import 'package:final_challenge/interfaces/task_interface.dart';

class MusicClassModel implements TasksInterface {
  MusicClassModel({
    required this.name,
    required this.date,
    required this.place,
    required this.startTime,
    required this.closingtime,
    required this.instrument,
    required this.instrumentType,
    required this.courseLevel,
    this.maximumEnergy = 100,
    this.maximumMusicianQuality = 100,
  });

  String instrumentType;
  String instrument;
  String courseLevel;

  int maximumMusicianQuality;
  int maximumEnergy;

  double _duration = 0;
  int _newChordOrNote = 0;
  int _myEnergy = 0;
  int _musicianQuality = 10;
  String musicianLevel = "Iniciante";

  void _correctNegativeQuality() {
    if (_musicianQuality <= 0) {
      _musicianQuality = 0;
      print('Sua qualidade como músico/musicista: $_musicianQuality');
    } else {
      print('Sua qualidade como músico/musicista: $_musicianQuality');
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

  void _changeMusicianQuality(int quality) {
    _musicianQuality += quality;
  }

  void _correctPositiveQuality() {
    if (_musicianQuality >= maximumMusicianQuality) {
      _musicianQuality = maximumMusicianQuality;
      print('Sua qualidade como músico/musicista: $_musicianQuality');
    } else {
      print('Sua qualidade como músico/musicista: $_musicianQuality');
    }
  }

  void seeMusicianLevel() {
    if (_musicianQuality <= 30) {
      musicianLevel = "Iniciante";
      print('Você está no nível: $musicianLevel');
    } else if (_musicianQuality > 30 && _musicianQuality <= 70) {
      musicianLevel = "Intermediário";
      print('Você está no nível: $musicianLevel');
    } else if (_musicianQuality > 70) {
      musicianLevel = "Profissional";
      print('Você está no nível: $musicianLevel');
    }
  }

  void trainingChordsOrNotes() {
    _changeMyEnergy(-10);
    _correctNegativeEnergy();
    _changeMusicianQuality(15);
    _correctPositiveQuality();
  }

  void isNotTraining() {
    _changeMyEnergy(5);
    _correctPositiveEnergy();
    _changeMusicianQuality(-5);
    _correctNegativeQuality();
  }

  void studyingMusic() {
    _changeMyEnergy(-3);
    _correctNegativeEnergy();
    _changeMusicianQuality(10);
    _correctPositiveQuality();
  }

  void isNotStudying() {
    _changeMyEnergy(5);
    _correctPositiveEnergy();
    _changeMusicianQuality(-10);
    _correctNegativeQuality();
  }

  void drinkWater() {
    _changeMyEnergy(25);
    _correctPositiveEnergy();
    print('Sua qualidade como músico/musicista: $_musicianQuality');
  }

  void resting() {
    _changeMyEnergy(80);
    _correctPositiveEnergy();
    _changeMusicianQuality(70);
    _correctPositiveQuality();
  }

  void newChordOrNote() {
    _newChordOrNote += 1;
    _changeMyEnergy(-5);
    _correctNegativeEnergy();
    _changeMusicianQuality(8);
    _correctPositiveQuality();
  }

  void chordsOrNotesLearned() {
    print('$_newChordOrNote Acorde(s) e nota(s) aprendido(s).');
  }

  void musicalPerformance() {
    _changeMyEnergy(-20);
    _correctNegativeEnergy();
    _changeMusicianQuality(30);
    _correctPositiveQuality();
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
        'Turno: ${taskShift.name}\n'
        'Horário de inicio: ${startTime.toStringAsFixed(2)}\n'
        'Horário de encerramento: ${closingtime.toStringAsFixed(2)}\n'
        'Tipo de instrumento: $instrumentType\n'
        'Instrumento: $instrument\n'
        'Nível do curso: $courseLevel\n');
  }

  @override
  void finishTask() {
    completeTask = "s";
    print('\nAtividade concluída!');
    chordsOrNotesLearned();
    taskDuration();
    print('Sua energia: $_myEnergy');
    print('Sua qualidade como músico/musicista: $_musicianQuality');
    shift();
    seeMusicianLevel();
  }

  @override
  String name;

  @override
  double closingtime;

  @override
  String completeTask = "n";

  @override
  bool completed = false;

  @override
  String date;

  @override
  String place;

  @override
  double startTime;

  @override
  TaskShift taskShift = TaskShift.diurno;

  @override
  TaskType taskType = TaskType.musica;
}
