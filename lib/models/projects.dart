// To parse this JSON data, do
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
}