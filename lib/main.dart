/*import 'package:app_project/screens/partner_page.dart';
import 'package:flutter/material.dart';
//import 'package:app_project/screens/slpash.dart';
import 'package:app_project/model/partner.dart';




void main() {
  runApp(const MyApp());

} // main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Partner()
    );
  } // build
} // MyApp*/

import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import 'package:app_project/model/partner.dart';
import 'package:app_project/screens/stacked_partner.dart';
import 'package:carousel_slider/carousel_slider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Partner> partners = getPartner();
  @override
  Widget build(BuildContext context) {

  
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 254, 251, 228),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
           const Text(
                'In order to support these small realities, we must thanks our partners, large companies that believe in small things',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 1, 97, 4),
                  fontSize: 20),
                ),

              const SizedBox(
                height: 20,
                ),

          CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            scrollDirection: Axis.vertical,
            enableInfiniteScroll: false,
          ),
          items: partners.map((item) {
            return PartnerItem(
              name: item.name,
              phrase: item.phrase,
              imagePath: item.imagePath,
              //imagePath: item.imagePath,
            );
          }).toList(),
        ),
    ] ),)),
)));
}
}
