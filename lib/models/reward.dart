import 'package:flutter/material.dart';

class Reward extends ChangeNotifier {
  final int id;
  final String name;
  final String phrase;
  final String imagePath;
  final String qrcode;

  Reward(
      {required int this.id,
      required String this.name,
      required String this.phrase,
      required String this.qrcode,
      required String this.imagePath});
}

List<Reward> getReward() {
  List<Reward> rewards = [];

  rewards.add(Reward(
    id: 1,
    name: "Jar of Jam",
    phrase: "as a gift for your commitment",
    qrcode: "assets/images/qrcode.png",
    imagePath: "assets/images/miele.jpg",
  ));

  rewards.add(Reward(
    id: 2,
    name: "20% discount on vegetables",
    phrase: "for your effort",
    qrcode: "assets/images/qrcode.png",
    imagePath: "assets/images/radicchio_Andrea.jpg",
  ));

  rewards.add(Reward(
    id: 3,
    name: "Jar of Honey",
    phrase: "as a gift for your help",
    qrcode: "assets/images/qrcode.png",
    imagePath: "assets/images/miele.jpg",
  ));

  rewards.add(Reward(
    id: 4,
    name: "1 kg of half-price courgettes",
    phrase: "for your barbecue with friends",
    qrcode: "assets/images/qrcode.png",
    imagePath: "assets/images/zucchine.jpg",
  ));

  rewards.add(Reward(
    id: 5,
    name: "Bunch of Rocket Salad",
    phrase: "for your cold pasta with cherry tomatoes and mozzarella cheese",
    qrcode: "assets/images/qrcode.png",
    imagePath: "assets/images/rucola.jpg",
  ));

  return rewards;
}
