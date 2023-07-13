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
      id: 0,
      name: "Api di Dario",
      address: "Via sconosciuta 1, Feltre",
      phrase: "Production and sale of organic honey. Our bees feed from mountain flowers and plants that give a unique taste to our honey produced with great care and passion. Come and taste it",
      imagePath: "assets/images/miele_Dario.jpg",
      ));

    farms.add(Projects(
      id: 1,
      name: "radicchio di Andrea",
      address: "Via sconosciuta 2, Treviso",
      phrase: "Our radicchio rosso tardivo is produced by planting in open fields. The processing is very complex but the result unique. 50 years of experience",
      imagePath: "assets/images/radicchio_Andrea.jpg",
      ));

    farms.add(Projects(
      id: 2,
      name: "carciofi di Matteo",
      address: "Via sconosciuta 3, Treviso",
      phrase: "Organic artichoke production, hand-harvested from March. Come visit our store, we offer many other fruits and vegetables",
      imagePath: "assets/images/carciofi_Matteo.jpg",
      ));

    farms.add(Projects(
      id: 3,
      name: "zucchine di Anna",
      address: "Via sconosciuta 4, Belluno",
      phrase: "Are you looking for a zucchini producer and supplier? Come visit us! Since 2005, we have specialized in the production of zucchini, hand-picked and high quality",
      imagePath: "assets/images/zucchine_Anna.jpg",
      ));

    farms.add(Projects(
      id: 4,
      name: "Insalata di Jenny",
      address: "Via sconosciuta 5, Padova",
      phrase: "Every day on the table with freshness, taste and crispness. We take care of everything from growing to packing. Any type of salad from the local area",
      imagePath: "assets/images/insalata_Jenny.jpg",
      ));

    return farms;
}


class SelectedProject extends ChangeNotifier {

  List<Projects> proj = getProject();
  List<int> ids = [0, 1, 2, 3, 4];
  int i = 0;

  void selectProject(id) {
    for (i in ids) {
      proj[i].light = false;
    }
    proj[id].light = true;
    notifyListeners();
  }

  int getSelectedProject(){
    int idSelected = -1;
    for (i in ids) {
      if (proj[i].light) {
        idSelected = i;
      } else { debugPrint('no project selected');null; }
    }
    return idSelected;
  }
}
