import 'package:flutter/material.dart';

class Projects extends ChangeNotifier {
  final int id;
  final String name;
  final String address;
  final String phrase;
  final String imagePath;
  bool light;

  Projects(
      {required int this.id,
      required String this.name,
      required String this.address,
      required String this.phrase,
      required String this.imagePath,
      bool this.light = false});
}


List<Projects> getProject() {
  List<Projects> farms = [];

    farms.add(Projects(
      id: 1,
      name: "Api di Dario",
      address: "Via sconosciuta 1, Feltre",
      phrase: "Production and sale of organic honey. Our bees feed from mountain flowers and plants that give a unique taste to our honey produced with great care and passion. Come and taste it",
      imagePath: "assets/images/miele_Dario.jpg",
      ));

    farms.add(Projects(
      id: 2,
      name: "radicchio di Andrea",
      address: "Via sconosciuta 2, Treviso",
      phrase: "Our radicchio rosso tardivo is produced by planting in open fields. The processing is very complex but the result unique. 50 years of experience",
      imagePath: "assets/images/radicchio_Andrea.jpg",
      ));

    farms.add(Projects(
      id: 3,
      name: "carciofi di Matteo",
      address: "Via sconosciuta 3, Treviso",
      phrase: "Organic artichoke production, hand-harvested from March. Come visit our store, we offer many other fruits and vegetables",
      imagePath: "images/carciofi_Matteo.jpg",
      ));

    farms.add(Projects(
      id: 4,
      name: "zucchine di Anna",
      address: "Via sconosciuta 4, Belluno",
      phrase: "Are you looking for a zucchini producer and supplier? Come visit us! Since 2005, we have specialized in the production of zucchini, hand-picked and high quality",
      imagePath: "images/zucchine_Anna.jpg",
      ));

    farms.add(Projects(
      id: 5,
      name: "Insalata di Jenny",
      address: "Via sconosciuta 5, Padova",
      phrase: "Every day on the table with freshness, taste and crispness. We take care of everything from growing to packing. Any type of salad from the local area",
      imagePath: "images/insalata_Jenny.jpg",
      ));

    return farms;
}


class SelectedProject extends ChangeNotifier {

  List<Projects> proj = getProject();
  List<int> ids = [1, 2, 3, 4, 5];
  int i = 1;

  void selectProject(id) {
    for (i in ids){proj[i].light = false;}
    proj[id].light = true;
    notifyListeners();
  }
}
