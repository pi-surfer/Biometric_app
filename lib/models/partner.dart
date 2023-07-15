//import 'package:flutter/material.dart';

class Sponsor {
  int ?idx;
  final String name;
  final String phrase;
  final String imagePath;
  final Uri url;

  Sponsor({this.idx, required this.name, 
  required this.url, 
  required this.phrase,required this.imagePath});
}

List<Sponsor> getPartner() {
  List<Sponsor> partners = [];

    partners.add(Sponsor(
      idx: 0,
      name: "Generali",
      url: Uri.parse('https://www.generali.it/risparmio-investimenti/investimento/generasviluppo-sostenibile'),
      //url: 'https://www.generali.it/risparmio-investimenti/investimento/generasviluppo-sostenibile' as Uri,
      phrase: "SOCIETY & HEALTH",
      imagePath: "assets/images/generali.jpg",  
      ));
    partners.add(Sponsor(
      idx: 1,
      name: "Patagonia",
      url: Uri.parse("https://eu.patagonia.com/gb/en/actionworks/campaigns/?utm_source=patagonia.com&utm_medium=referral&utm_campaign=subnav"),
      //url: "https://eu.patagonia.com/gb/en/actionworks/campaigns/?utm_source=patagonia.com&utm_medium=referral&utm_campaign=subnav" as Uri,
      phrase: "STARTS WITH LITTLE THINGS",
      imagePath: "assets/images/patagonia.jpg",
    ));
    partners.add(Sponsor(
      idx: 2,
      name: "Nike",
      url: Uri.parse("https://www.nike.com/it/sostenibilita"),
      //url: "https://www.nike.com/it/sostenibilita" as Uri,
      phrase: "FOLLOW YOUR GOALS",
      imagePath: "assets/images/nike.jpg",
    ));
    partners.add(Sponsor(
      idx: 3,
      name: "Google",
      url: Uri.parse(""),
      //url: "" as Uri,
      phrase: "STRONGER TOGETHER",  
      imagePath: "assets/images/google.jpg",
    ));
    partners.add(Sponsor(
      idx: 4,
      name: "gruppo Hera",
      url: Uri.parse("https://www.gruppohera.it/gruppo/sostenibilita/bilancio-di-sostenibilita/bs"),
      //url: "https://www.gruppohera.it/gruppo/sostenibilita/bilancio-di-sostenibilita/bs" as Uri,
      phrase: "SHARED VALUES",
      imagePath: "assets/gif/hera.gif",   
    ));
    partners.add(Sponsor(
      idx: 5,
      name: "Treedom",
      url: Uri.parse("https://www.treedom.net/it"),
      //url: "https://www.treedom.net/it" as Uri,
      phrase: "LET'S GREEN THE PLANET",
      imagePath: "assets/gif/treedom.gif",   
    ));
    partners.add(Sponsor(
      idx: 6,
      name: "Enel",
      url: Uri.parse("https://www.enelcuore.it/"),
      //url: "https://www.enelcuore.it/" as Uri,
      phrase: "HEART THEMES",
      imagePath: "assets/images/enel.jpg", 
    ));
    partners.add(Sponsor(
      idx: 7,
      name: "Salomon",
      url: Uri.parse("https://www.salomon.com/it-it/sustainability"),
      //url: "https://www.salomon.com/it-it/sustainability" as Uri,
      phrase: "RESPONSIBLE INNOVATION",  
      imagePath: "assets/images/salomon.jpg",
    ));
    partners.add(Sponsor(
      idx: 8,
      name: "Fjällräven",
      url: Uri.parse("https://www.fjallraven.com/eu/en-gb/about-fjallraven/sustainability"),
      //url: "https://www.fjallraven.com/eu/en-gb/about-fjallraven/sustainability" as Uri,
      phrase: "CARE & REPAIR",
      imagePath: "assets/images/fjällräven.jpg", 
    ));
    partners.add(Sponsor(
      idx: 9,
      name: "The North Face",
      url: Uri.parse("https://www.thenorthface.it/innovation/sustainability/operations/climate-change.html"),
      //url: "https://www.thenorthface.it/innovation/sustainability/operations/climate-change.html" as Uri,
      phrase: "WALLS ARE MEANT FOR CLIMBING",  
      imagePath: "assets/images/thenorthface.jpg",
    ));

    return partners;
}



