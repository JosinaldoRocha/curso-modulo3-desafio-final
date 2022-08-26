import 'package:final_challenge/features/see-tasks/see_task_title.dart';
import 'package:final_challenge/interfaces/page_interface.dart';
import 'package:final_challenge/interfaces/task_interface.dart';
import 'package:final_challenge/models/camping_model.dart';
import 'package:final_challenge/models/dance_class_model.dart';
import 'package:final_challenge/models/music_class_model.dart';
import 'package:final_challenge/models/other_tasks.dart';
import 'package:final_challenge/models/play_soccer_model.dart';
import 'package:final_challenge/util/clean_screen.dart';
import 'package:final_challenge/util/read.dart';
import 'package:final_challenge/util/task_list.dart';

class RunTasks implements Page {
  @override
  void init() {
    int option = 1;
    do {
      Clean.screen();
      if (taskList.isNotEmpty) {
        SeeTaskTitle().init();

        runTaskMenu();
      } else {
        print('\nNão há tarefas para executar!\n');
      }

      option =
          Read.readInt(message: '[1] Executar uma nova tarefa     [2] Voltar');
    } while (option == 1);
    Clean.screen();
  }
}

void runTaskMenu() {
  int code = Read.readInt(
      message: 'Digite o código da tarefa que você quer executar:');
  Clean.screen();
  if (code > 0 && code <= taskList.length) {
    if (taskList[code - 1].completed == false) {
      TasksInterface currentTask = taskList[code - 1];

      if (currentTask is PlaySoccerModel) {
        runPlaySoccer(currentTask);
      }
      if (currentTask is DanceClassModel) {
        runDanceClass(currentTask);
      }
      if (currentTask is MusicClassModel) {
        runMusicClass(currentTask);
      }
      if (currentTask is CampingModel) {
        runCamping(currentTask);
      }
      if (currentTask is OtherTaskModel) {
        runOtherTask(currentTask);
      }

      print('');
    } else {
      print('\nVocê já concluiu essa atividade, anteriormente.\n'
          'Escolha uma atividade, não concluída, para executar!\n');
    }
  } else {
    print('\nCódigo de tarefas inválido!\n');
  }
}

void runPlaySoccer(PlaySoccerModel playSoccer) {
  int option = 0;
  do {
    print('Escolha uma ação');
    option = Read.readInt(
        message: '[1] Correr\n[2] Cobrar escanteio\n[3] cobrar pênalti\n'
            '[4] Marcar um gol\n[5] Chutar\n[6] Beber água\n[7] Descansar\n'
            '[8] Ver gols marcados\n[9] Jogador machucado\n[10] Finalizar atividade');

    Clean.screen();
    if (option == 1) {
      playSoccer.running();
    } else if (option == 2) {
      playSoccer.corner();
    } else if (option == 3) {
      playSoccer.takeAPenalty();
    } else if (option == 4) {
      playSoccer.newGoal();
    } else if (option == 5) {
      playSoccer.kick();
    } else if (option == 6) {
      playSoccer.drinkWater();
    } else if (option == 7) {
      playSoccer.resting();
    } else if (option == 8) {
      playSoccer.goalscored();
    } else if (option == 9) {
      playSoccer.isHurt();
    } else if (option == 10) {
    } else {
      print('Opção inválida');
    }
  } while (option != 10);
  playSoccer.finishTask();
}

void runDanceClass(DanceClassModel danceClass) {
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
      danceClass.studyingDance();
    } else if (option == 2) {
      danceClass.trainingPasses();
    } else if (option == 3) {
      danceClass.isNotStudying();
    } else if (option == 4) {
      danceClass.isNotTrainingdance();
    } else if (option == 5) {
      danceClass.dancePerformance();
    } else if (option == 6) {
      danceClass.drinkWater();
    } else if (option == 7) {
      danceClass.resting();
    } else if (option == 8) {
      danceClass.newPass();
    } else if (option == 9) {
      danceClass.learnedPasses();
    } else if (option == 10) {
      danceClass.seeDancerLevel();
    } else if (option == 11) {
    } else {
      print('Opção inválida');
    }
  } while (option != 11);
  danceClass.finishTask();
}

void runMusicClass(MusicClassModel musicClass) {
  int option = 0;
  do {
    print('Escolha uma ação');
    option = Read.readInt(
        message:
            '[1] Estudando música\n[2] Treinar acordes/notas\n[3] Pausa na aula\n'
            '[4] Parar de treinar acordes/notas\n[5] Fazer uma apresentação musical\n[6] Beber água\n'
            '[7] Descansar\n[8] Aprender novo acorde/nota\n[9] Ver quantos acordes/notas aprendi\n'
            '[10] Ver meu nível como músico\n[11] Finalizar atividade');

    Clean.screen();
    if (option == 1) {
      musicClass.studyingMusic();
    } else if (option == 2) {
      musicClass.trainingChordsOrNotes();
    } else if (option == 3) {
      musicClass.isNotStudying();
    } else if (option == 4) {
      musicClass.isNotTraining();
    } else if (option == 5) {
      musicClass.musicalPerformance();
    } else if (option == 6) {
      musicClass.drinkWater();
    } else if (option == 7) {
      musicClass.resting();
    } else if (option == 8) {
      musicClass.newChordOrNote();
    } else if (option == 9) {
      musicClass.chordsOrNotesLearned();
    } else if (option == 10) {
      musicClass.seeMusicianLevel();
    } else if (option == 11) {
    } else {
      print('Opção inválida');
    }
  } while (option != 11);
  musicClass.finishTask();
}

void runCamping(CampingModel camping) {
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
      camping.cleanCampsite();
    } else if (option == 2) {
      camping.setUpCamp();
    } else if (option == 3) {
      camping.prepareLunch();
    } else if (option == 4) {
      camping.prepareDinner();
    } else if (option == 5) {
      camping.goOutHunting();
    } else if (option == 6) {
      camping.drinkWater();
    } else if (option == 7) {
      camping.resting();
    } else if (option == 8) {
      camping.funMoment();
    } else if (option == 9) {
      camping.wasteFood();
    } else if (option == 10) {
      camping.burntFood();
    } else if (option == 11) {
      camping.toSleep();
    } else if (option == 12) {
    } else {
      print('Opção inválida');
    }
  } while (option != 12);
  camping.finishTask();
}

void runOtherTask(OtherTaskModel otherTask) {
  int option = 0;
  do {
    print('Escolha uma ação');
    option = Read.readInt(
        message: '[1] Interagir\n[2] Beber água\n[3] Finalizar atividade');

    Clean.screen();
    if (option == 1) {
      otherTask.interacting();
    } else if (option == 2) {
      otherTask.drinkWater();
    } else if (option == 3) {
    } else {
      print('Opção inválida');
    }
  } while (option != 3);
  otherTask.finishTask();
}
