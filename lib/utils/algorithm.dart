import 'dart:math';

import 'package:app_project/models/db.dart';


// funzione per avere l'indice di miglioramento dello stato di salute
// serve scegliere come calcolarlo magari tenendo conto dell'articolo sul drive


// funzione che calcola lo Score che incrementa giornalmente
 List<Score> getGlobalScore(List<Kalories> kalories, List<Steps> steps, List<Times> times) {

  int dailyScore = 0;
   for (Kalories kcal in kalories) {
    int valKcal = kcal.value;
    if (valKcal != 0) {
      if (valKcal >= 300) {
        dailyScore = dailyScore + 1;
      }
    }

   }

   for (Steps stp in steps) {
    int valStep = stp.value;
    if (valStep != 0) {
      if (valStep >= 6000) {
        dailyScore = dailyScore + 1;
      }
    }
   }

   for (Times tm in times) {
    double valTime = tm.value;
    if (valTime != 0) {
      if (valTime >= 60) {
        dailyScore = dailyScore + 1;
      }
    }

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

