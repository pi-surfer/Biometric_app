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
    String value;

    Projects({
        required this.id,
        required this.name,
        required this.address,
        required this.phone,
        required this.website,
        required this.description,
        required this.value,
    });

    factory Projects.fromJson(Map<String, dynamic> json) => Projects(
        id: json["id"],
        name: json["name"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        description: json["description"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "description": description,
        "value": value,
    };
}

class Address {
    String street;
    String city;
    Geo geo;

    Address({
        required this.street,
        required this.city,
        required this.geo,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        city: json["city"],
        geo: Geo.fromJson(json["geo"]),
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "geo": geo.toJson(),
    };
}

class Geo {
    String lat;
    String lng;

    Geo({
        required this.lat,
        required this.lng,
    });

    factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}