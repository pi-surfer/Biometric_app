import 'package:app_project/models/text_styles.dart';
import 'package:app_project/screens/partner_structure.dart';
import 'package:flutter/material.dart';
import 'package:app_project/models/partner.dart';
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
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 254, 251, 228),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 8.0, right: 8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      'In order to support these small realities, we must thank our partners, large companies that believe in small things',
                      textAlign: TextAlign.start,
                      style: subtitleStyle),
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
                ]),
          )),
        ));
  }
}
