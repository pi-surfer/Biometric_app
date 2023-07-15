
import 'package:app_project/database/entities/entities.dart';


int getAerobicTime(List<HR> hr) {
  List<int> hrValues = List.generate(hr.length, (index) => 0);
  double aerobicTime = 0; // time in minutes

  for (int idx = 0; idx < hr.length; idx++){
    hrValues[idx] = hr[idx].value;
    if (hrValues[idx] > 1) {
      aerobicTime = aerobicTime + 5/60;
    }
  }
  return aerobicTime as int;
}

int getTotalSteps(List<Steps> steps) {
  int totalSteps = 0;
  for(Steps stp in steps) {
    totalSteps = totalSteps + stp.value;
  }
  return totalSteps;
}

double getTotalCalories(List<Cal> calories) {
  double totalCalories = 0;
  for(Cal kcal in calories) {
    totalCalories = totalCalories + kcal.value;
  }
  return totalCalories;
}

 int getDailyScore(double totalCalories, int totalSteps, int aerobicTime) {

  int dailyScore = 0;

  if (aerobicTime >= 30) {
    dailyScore = dailyScore + 1;
  }

  if (totalSteps >= 2500) {
    dailyScore = dailyScore + 1;
  }

  if (totalCalories >= 300) {
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