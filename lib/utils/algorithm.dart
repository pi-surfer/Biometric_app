import 'dart:math';
import 'package:collection/collection.dart';
import 'package:app_project/models/db.dart';


int getAerobicTime(List<HR> hr) {
  List<int> hrValues = [];
  int aerobicTime = 0; // time in minutes

  for (int idx = 0; idx < hr.length; idx++){
    hrValues[idx] = hr[idx].value;
    if (hrValues[idx] > 120) {
      aerobicTime = aerobicTime + 1;
    }
  }
  return aerobicTime;
}

int getTotalSteps(List<Steps> steps) {
  int totalSteps = 0;
  for(Steps stp in steps) {
    totalSteps = totalSteps + stp.value;
  }
  return totalSteps;
}

double getTotalKalories(List<Kalories> kalories) {
  double totalKalories = 0;
  for(Kalories kcal in kalories) {
    totalKalories = totalKalories + kcal.value;
  }
  return totalKalories;
}


// funzione per avere l'indice di miglioramento dello stato di salute
// serve scegliere come calcolarlo magari tenendo conto dell'articolo sul drive

// funzione che calcola lo Score che incrementa giornalmente
 List<Score> getGlobalScore(double totalKalories, int totalSteps, int aerobicTime) {

  int dailyScore = 0;

  if (aerobicTime >= 60) {
    dailyScore = dailyScore + 1;
  }

  if (totalSteps >= 6000) {
    dailyScore = dailyScore + 1;
  }

  if (totalKalories >= 300) {
    dailyScore = dailyScore + 1;
  }

  return dailyScore as List<Score>;

}


class Score {
}


// funzione per calcolare se si sta eseguendo attività aerobica sulla base
// dell'heart rate


// funzione che calcola per quanto tempo si mantiene l'attività aerobica


// funzione che calcola i passi totali nella giornata (in teoria basta prenderli
// semplicemente dal database)


