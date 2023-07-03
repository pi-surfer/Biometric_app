import 'package:flutter/material.dart';

class Medal extends ChangeNotifier {
  final String title;
  bool isCompleted;

  Medal({required this.title, this.isCompleted = false,});

  void setCompleted(){
    isCompleted = true;
    notifyListeners();
  }
}
