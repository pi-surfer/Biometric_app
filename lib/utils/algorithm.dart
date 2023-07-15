import 'package:app_project/models/db.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO : NELLE SHARED PREFERENCES CHE DOVREBBERO ESSERE SALVATE DAL PROFILO C'E' ANCHE L'ETA', QUINDI SI POTREBBE FARE IL 60% DI 220-ETA' PER LA SOGLIA AEROBICA


int getAerobicTime(List<HR> hr) {
  List<int> hrValues = List.generate(hr.length, (index) => 0);
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

 int getDailyScore(double totalKalories, int totalSteps, int aerobicTime) {
  int dailyScore = 0;
  if (aerobicTime >= 30) {
    dailyScore = dailyScore + 1;
  }
  if (totalSteps >= 6000) {
    dailyScore = dailyScore + 1;
  }
  if (totalKalories >= 2000) {
    dailyScore = dailyScore + 1;
  }
  return dailyScore;

}

int getGlobalScore(int dailyScore){
    int GlobalScore = 0;
    //int ds = getDailyScore(totalKalories, totalSteps, aerobicTime);
    //int? ds = await _getDailyScore();
    GlobalScore = GlobalScore + dailyScore;
    if (GlobalScore > 90) {
      GlobalScore = 0;
    }
    return GlobalScore;
  }
