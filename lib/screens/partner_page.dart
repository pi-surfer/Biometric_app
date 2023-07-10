import 'dart:convert';
import 'dart:async';
import 'package:app_project/screens/partner_structure.dart';
import 'package:flutter/material.dart';
import 'package:app_project/model/partner.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Partner extends StatefulWidget {
  static const route = '/partnerPage/';
  static const routeDisplayName = 'PartnerPage';

  const Partner({Key? key}) : super(key: key);

  @override
  State<Partner> createState() => PartnerState();
}


class PartnerState extends State<Partner> {
  List<Sponsor> partners = getPartner();
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
              url: item.url,
            );
          }).toList(),
        ),
    ] ),)),
)));
}
}

/*

                   Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/nike.jpg"), 
                        fit: BoxFit.cover), 
                      borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(10),
                      width: 400.0,
                      height: 400.0,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Nike',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        Text('FOLLOW YOUR GOALS',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        FilledButton(
                            onPressed: _launchURL,
                              style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 254, 251, 228)),  
                            ),
                            child: Text('More informations', style: 
                            TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 1, 97, 4),
                            ),),
                          ),
                      ],                   
                      )),             
                
                const SizedBox(
                    height: 7,
                  ),
                  
                                 
                                   
                    ]),))));}}             
                   
 */



