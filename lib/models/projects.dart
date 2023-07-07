/*// To parse this JSON data, do
//
//     final projects = projectsFromJson(jsonString);

import 'dart:convert';

List<Projects> projectsFromJson(String str) => List<Projects>.from(json.decode(str).map((x) => Projects.fromJson(x)));

String projectsToJson(List<Projects> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Projects {
    int id;
    String name;
    Address address;
    String phone;
    String website;
    String description;
    bool value;
    bool selected;

    Projects({
        required this.id,
        required this.name,
        required this.address,
        required this.phone,
        required this.website,
        required this.description,
        required this.value,
        required this.selected,
    });

    factory Projects.fromJson(Map<String, dynamic> json) => Projects(
        id: json["id"],
        name: json["name"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        description: json["description"],
        value: json["value"],
        selected: json["selected"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "description": description,
        "value": value,
        "selected": selected,
    };
}

class Address {
    String street;
    String city;

    Address({
        required this.street,
        required this.city,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
    };
} */

import 'package:flutter/material.dart';

class Projects {
  //final int id;
  int id; 
  //final String name;
  String name;
  //final String address;
  String address;
  //final String phrase;
  String phrase;
  //final String imagePath;
  String imagePath;
  //final bool light;
  bool light;
  //final bool selected;
  bool selected;

  Projects({required this.id, required this.name, required this.address, 
  required this.phrase,required this.imagePath, required this.light, required this.selected });

  //Projects({
  //  Key? key,  
  //}):super(key: key);

  //get farms => length(farms);
  
  //length(farms) {
  //  return length(farms);
  //}
}

List<Projects> getProject() {
  List<Projects> farms = [];

    farms.add(Projects(
      id: 1,
      name: "Api di Dario",
      address: "Via sconosciuta 1, Feltre",
      phrase: "descrizione del posto",
      imagePath: "assets/images/miele_Dario.jpg",
      light: false,
      selected: false,  
      ));

    farms.add(Projects(
      id: 2,
      name: "radicchio di Andrea",
      address: "Via sconosciuta 2, Treviso",
      phrase: "descrizione del posto",
      imagePath: "assets/images/radicchio_Andrea.jpg",
      light: false,
      selected: false,  
      ));

    farms.add(Projects(
      id: 3,
      name: "carciofi di Matteo",
      address: "Via sconosciuta 3, Treviso",
      phrase: "descrizione del posto",
      imagePath: "assets/images/carciofi_Matteo.jpg",
      light: false,
      selected: false,  
      ));

    farms.add(Projects(
      id: 4,
      name: "zucchine di Anna",
      address: "Via sconosciuta 4, Belluno",
      phrase: "descrizione del posto",
      imagePath: "assets/images/zucchine_Anna.jpg",
      light: false,
      selected: false,  
      ));

    farms.add(Projects(
      id: 5,
      name: "Insalata di Jenny",
      address: "Via sconosciuta 5, Padova",
      phrase: "descrizione del posto",
      imagePath: "assets/images/insalata_Jenny.jpg",
      light: false,
      selected: false,  
      ));



    return farms;
}
