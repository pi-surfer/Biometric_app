// To parse this JSON data, do
//
//     final partner = partnerFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

List<Partner> partnerFromJson(String str) => List<Partner>.from(json.decode(str).map((x) => Partner.fromJson(x)));

String partnerToJson(List<Partner> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Partner {
    int id;
    String name;
    Uri url;
    String phrase;
    AssetImage image;

    Partner({
        required this.id,
        required this.name,
        required this.url,
        required this.phrase,
        required this.image,
    });

    factory Partner.fromJson(Map<String, dynamic> json) => Partner(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        phrase: json["phrase"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "phrase": phrase,
        "image": image,
    };
}