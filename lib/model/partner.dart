// To parse this JSON data, do
//
//     final partner = partnerFromJson(jsonString);

/*import 'dart:convert';

import 'package:app_project/screens/stacked_partner.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/*List<Partner> partnerFromJson(String str) => List<Partner>.from(json.decode(str).map((x) => Partner.fromJson(x)));

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
}*/


class Partner extends StatelessWidget {
  Partner({
    super.key,
    //required this.id,
    required this.name,
    required this.url,
    required this.phrase,
    required this.imagePath,  
  });

  final String imagePath;
  final String name;
  final String phrase;
  //final int id;
  final Uri url;


  final List<Widget> partner = <Widget>[
    Partner(
      //id: 1,
      name: "Generali",
      url: "https://www.generali.it/risparmio-investimenti/investimento/generasviluppo-sostenibile" as Uri,
      phrase: "SOCIETY & HEALTH",
      imagePath: "assets/images/generali.jpg",  
      ),
    Partner(
      //id: 2,
      name: "Patagonia",
      url: "https://eu.patagonia.com/gb/en/actionworks/campaigns/?utm_source=patagonia.com&utm_medium=referral&utm_campaign=subnav" as Uri,
      phrase: "STARTS WITH LITTLE THINGS",
      imagePath: "assets/images/patagonia.jpg",
    ),
    Partner(
      //id: 3,
      name: "Nike",
      url: "https://www.nike.com/it/sostenibilita" as Uri,
      phrase: "FOLLOW YOUR GOALS",
      imagePath: "assets/images/nike.jpg",
    ),
    Partner (
      //id: 4,
      name: "Google",
      url: "" as Uri,
      phrase: "STRONGER TOGETHER",  
      imagePath: "assets/images/google.jpg",
    ),
    Partner (
      //id: 5,
      name: "gruppo Hera",
      url: "https://www.gruppohera.it/gruppo/sostenibilita/bilancio-di-sostenibilita/bs" as Uri,
      phrase: "SHARED VALUES",
      imagePath: "assets/gif/hera.gif",   
    ),
    Partner(
      //id: 6,
      name: "Treedom",
      url: "https://www.treedom.net/it" as Uri,
      phrase: "LET'S GREEN THE PLANET",
      imagePath: "assets/gif/treedom.gif",   
    ),
    Partner (
      //id: 7,
      name: "Enel",
      url: "https://www.enelcuore.it/" as Uri,
      phrase: "HEART THEMES",
      imagePath: "assets/images/enel.jpg", 
    ),
    Partner (
      //id: 8,
      name: "Salomon",
      url: "https://www.salomon.com/it-it/sustainability" as Uri,
      phrase: "RESPONSIBLE INNOVATION",  
      imagePath: "assets/images/salomon.jpg",
    ),
    Partner (
      //id: 9,
      name: "Fjällräven",
      url: "https://www.fjallraven.com/eu/en-gb/about-fjallraven/sustainability" as Uri,
      phrase: "CARE & REPAIR",
      imagePath: "assets/images/fjällräven.jpg", 
    ),
    Partner (
      //id: 10,
      name: "The North Face",
      url: "https://www.thenorthface.it/innovation/sustainability/operations/climate-change.html" as Uri,
      phrase: "WALLS ARE MEANT FOR CLIMBING",  
      imagePath: "assets/images/thenorthface.jpg",
    )
  ];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: StackedPartner(
        items: partner,
      ),
    );
  }
}

class PartnerCard extends StatelessWidget {
  const PartnerCard({
    super.key,
    //this.id,
    required this.name,
    required this.url,
    required this.phrase,
    required this.imagePath, 
  });

  final String imagePath;
  final String name;
  final String phrase;
  //int id;
  final Uri url;


  void _launchURL() async {
  if (!await launchUrl(url)) throw 'Could not launch $url';}

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                     image: AssetImage(imagePath),
                    fit: BoxFit.cover, opacity: 5, ), 
                    borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        Text(phrase,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        FilledButton(
                            onPressed: _launchURL,
                              style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 254, 251, 228)),  
                            ),
                            child: const Text('More informations', style: 
                            TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 1, 97, 4),
                            ),),
                          ),
          ],
        ),
      ),
    ])),);
  }
}
*/



import 'package:flutter/material.dart';

class Partner {
  final String name;
  final String phrase;
  final String imagePath;
  //final Uri url;

  Partner({required this.name, 
  //required this.url, 
  required this.phrase,required this.imagePath});
}

List<Partner> getPartner() {
  List<Partner> partners = [];

    partners.add(Partner(
      //id: 1,
      name: "Generali",
      //url: "https://www.generali.it/risparmio-investimenti/investimento/generasviluppo-sostenibile" as Uri,
      phrase: "SOCIETY & HEALTH",
      imagePath: "assets/images/generali.jpg",  
      ));
    partners.add(Partner(
      //id: 2,
      name: "Patagonia",
      //url: "https://eu.patagonia.com/gb/en/actionworks/campaigns/?utm_source=patagonia.com&utm_medium=referral&utm_campaign=subnav" as Uri,
      phrase: "STARTS WITH LITTLE THINGS",
      imagePath: "assets/images/patagonia.jpg",
    ));
    partners.add(Partner(
      //id: 3,
      name: "Nike",
      //url: "https://www.nike.com/it/sostenibilita" as Uri,
      phrase: "FOLLOW YOUR GOALS",
      imagePath: "assets/images/nike.jpg",
    ));
    partners.add(Partner(
      //id: 4,
      name: "Google",
      //url: "" as Uri,
      phrase: "STRONGER TOGETHER",  
      imagePath: "assets/images/google.jpg",
    ));
    partners.add(Partner(
      //id: 5,
      name: "gruppo Hera",
      //url: "https://www.gruppohera.it/gruppo/sostenibilita/bilancio-di-sostenibilita/bs" as Uri,
      phrase: "SHARED VALUES",
      imagePath: "assets/gif/hera.gif",   
    ));
    partners.add(Partner(
      //id: 6,
      name: "Treedom",
      //url: "https://www.treedom.net/it" as Uri,
      phrase: "LET'S GREEN THE PLANET",
      imagePath: "assets/gif/treedom.gif",   
    ));
    partners.add(Partner(
      //id: 7,
      name: "Enel",
      //url: "https://www.enelcuore.it/" as Uri,
      phrase: "HEART THEMES",
      imagePath: "assets/images/enel.jpg", 
    ));
    partners.add(Partner(
      //id: 8,
      name: "Salomon",
      //url: "https://www.salomon.com/it-it/sustainability" as Uri,
      phrase: "RESPONSIBLE INNOVATION",  
      imagePath: "assets/images/salomon.jpg",
    ));
    partners.add(Partner(
      //id: 9,
      name: "Fjällräven",
      //url: "https://www.fjallraven.com/eu/en-gb/about-fjallraven/sustainability" as Uri,
      phrase: "CARE & REPAIR",
      imagePath: "assets/images/fjällräven.jpg", 
    ));
    partners.add(Partner(
      //id: 10,
      name: "The North Face",
      //url: "https://www.thenorthface.it/innovation/sustainability/operations/climate-change.html" as Uri,
      phrase: "WALLS ARE MEANT FOR CLIMBING",  
      imagePath: "assets/images/thenorthface.jpg",
    ));


    return partners;
}



