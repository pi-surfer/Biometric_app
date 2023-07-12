import 'package:app_project/models/db.dart';


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

  if (aerobicTime >= 60) {
    dailyScore = dailyScore + 1;
  }

  if (totalSteps >= 6000) {
    dailyScore = dailyScore + 1;
  }

  if (totalKalories >= 300) {
    dailyScore = dailyScore + 1;
  }

  return dailyScore;

}