/*import 'dart:convert';
import 'dart:async';
//import 'package:app_project/widgets/video_widget.dart';
//import 'package:app_project/widgets/video_widget1.dart';
import 'package:app_project/model/partner.dart';
import 'package:app_project/model/structure.dart';
import 'package:app_project/screens/stacked_partner.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
//import 'package:http/http.dart' as http;
import 'package:app_project/model/partner.dart';
/*
Uri _urlNike = Uri.parse('https://www.nike.com/it/sostenibilita');
Uri _urlGenerali = Uri.parse('https://www.generali.it/risparmio-investimenti/investimento/generasviluppo-sostenibile');
Uri _urlPatagonia = Uri.parse('https://eu.patagonia.com/gb/en/actionworks/campaigns/?utm_source=patagonia.com&utm_medium=referral&utm_campaign=subnav');
Uri _urlEnel = Uri.parse('https://www.enelcuore.it/');
Uri _urlTreedom = Uri.parse('https://www.treedom.net/it');
Uri _urlHera = Uri.parse('https://www.gruppohera.it/gruppo/sostenibilita/bilancio-di-sostenibilita/bs');
Uri _urlSalomon = Uri.parse('https://www.salomon.com/it-it/sustainability');
Uri _urlFjallraven = Uri.parse('https://www.fjallraven.com/eu/en-gb/about-fjallraven/sustainability');
Uri _urlNorthFace = Uri.parse('https://www.thenorthface.it/innovation/sustainability/operations/climate-change.html');


void _launchURL() async {
  if (!await launchUrl(_urlNike)) throw 'Could not launch $_urlNike';}

void _launchURL1() async {
  if (!await launchUrl(_urlGenerali)) throw 'Could not launch $_urlGenerali';}

void _launchURL2() async {
  if (!await launchUrl(_urlPatagonia)) throw 'Could not launch $_urlPatagonia';}

void _launchURL3() async {
  if (!await launchUrl(_urlHera)) throw 'Could not launch $_urlHera';}

void _launchURL4() async {
  if (!await launchUrl(_urlTreedom)) throw 'Could not launch $_urlTreedom';}

void _launchURL5() async {
  if (!await launchUrl(_urlEnel)) throw 'Could not launch $_urlEnel';}

void _launchURL6() async {
  if (!await launchUrl(_urlSalomon)) throw 'Could not launch $_urlSalomon';}

void _launchURL7() async {
  if (!await launchUrl(_urlFjallraven)) throw 'Could not launch $_urlFjallraven';}

void _launchURL8() async {
  if (!await launchUrl(_urlNorthFace)) throw 'Could not launch $_urlNorthFace';}


*/
  
class Partner extends StatefulWidget {
  static const route = '/partnerPage/';
  static const routeDisplayName = 'PartnerPage';

  const Partner({Key? key}) : super(key: key);

  @override
  State<Partner> createState() => PartnerState();
}


class PartnerState extends State<Partner> {
  
  

  // Fetch content from the json file
  /*Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/partner.json');
    final data = await json.decode(response);
    setState(() {
      _partner = data["partner"];
    });
  }
  
   
  @override
  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    readJson();
  }
*/
  //int _selIdx = 0;

  /*void _onItemTapped(int index) {
    setState(() {
      _selIdx = index;
    });
  }*/



/*
  @override
  Widget build(BuildContext context){
    return Scaffold(
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
                  color: Colors.black,
                  fontSize: 20),
                ),

              const SizedBox(
                height: 20,
                ),

                  
                  /*Structure(
                    id: _partner[0]['id'], 
                    name: _partner[0]['name'], 
                    url: _partner[0]['url'], 
                    phrase: _partner[0]['phrase'], 
                    image: _partner[0]['image'])*/
                  


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
                  
                  Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/patagonia.jpg"), 
                        fit: BoxFit.cover, opacity: 5), 
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    width: 400.0,
                    height: 400.0,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       Text('Patagonia',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        Text('STARTS WITH LITTLE THINGS',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        FilledButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 254, 251, 228)),
                            ),
                            onPressed: _launchURL2,                           
                            child: Text('Find out more', style: 
                            TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 1, 97, 4),
                            ),),
                          ),
                      ]                   
                      ), ),

                 const SizedBox(
                    height: 7,
                  ),
                  
                  Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/generali.jpg"), 
                        fit: BoxFit.cover, opacity: 5), 
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    width: 400.0,
                    height: 400.0,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Generali',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        Text('SOCIETY & HEALTH',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        FilledButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 254, 251, 228)),  
                            ),
                            onPressed: _launchURL1,
                            child: Text('Find out', style: 
                            TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 1, 97, 4),
                            ),),
                          ),
                      ]                   
                      ), ),

                  const SizedBox(
                    height: 7,
                  ),
                  
                  Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/google.jpg"), 
                        fit: BoxFit.cover, opacity: 5), 
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    width: 400.0,
                    height: 400.0,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Google',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        Text('STRONGER TOGETHER',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                      ]                   
                      ), ),

                   const SizedBox(
                    height: 7,
                  ),
                  
                    Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/gif/hera.gif"), 
                        fit: BoxFit.cover, opacity: 5), 
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    width: 400.0,
                    height: 400.0,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('gruppo Hera',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        Text('SHARED VALUES',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        FilledButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 254, 251, 228)),  
                            ),
                            onPressed: _launchURL3,
                            child: Text('Find out', style: 
                            TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 1, 97, 4),
                            ),),
                          ),
                      ]                   
                      ), ),

                   const SizedBox(
                    height: 7,
                  ),

                    Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/gif/treedom.gif"), 
                        fit: BoxFit.cover, opacity: 5), 
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    width: 400.0,
                    height: 400.0,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Treedom',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        Text('LET''S GREEN THE PLANET',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        FilledButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 254, 251, 228)),  
                            ),
                            onPressed: _launchURL4,
                            child: Text('Find out', style: 
                            TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 1, 97, 4),
                            ),),
                          ),
                      ]                   
                      ), ),

                   const SizedBox(
                    height: 7,
                  ),

                    Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/enel.jpg"), 
                        fit: BoxFit.cover, opacity: 5), 
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    width: 400.0,
                    height: 400.0,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Enel',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        Text('HEART THEMES',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        FilledButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 254, 251, 228)),  
                            ),
                            onPressed: _launchURL5,
                            child: Text('Find out', style: 
                            TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 1, 97, 4),
                            ),),
                          ),
                      ]                   
                      ), ),

                   const SizedBox(
                    height: 7,
                  ),

                    Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/fjällräven.jpg"), 
                        fit: BoxFit.cover, opacity: 5), 
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    width: 400.0,
                    height: 400.0,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Fjällräven',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        Text('CARE & REPAIR',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        FilledButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 254, 251, 228)),  
                            ),
                            onPressed: _launchURL7,
                            child: Text('Find out', style: 
                            TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 1, 97, 4),
                            ),),
                          ),
                      ]                   
                      ), ),

                   const SizedBox(
                    height: 7,
                  ),
                 
                    Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/thenorthface.jpg"), 
                        fit: BoxFit.cover, opacity: 5), 
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    width: 400.0,
                    height: 400.0,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('The North Face',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        Text('WALLS ARE MEANT FOR CLIMBING',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        FilledButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 254, 251, 228)),  
                            ),
                            onPressed: _launchURL8,
                            child: Text('Find out', style: 
                            TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 1, 97, 4),
                            ),),
                          ),
                      ]                   
                      ), ),

                   const SizedBox(
                    height: 7,
                  ),

                     Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/salomon.jpg"), 
                        fit: BoxFit.cover, opacity: 5), 
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    width: 400.0,
                    height: 400.0,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Salomon',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        Text('RESPONSIBLE INNOVATION',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        FilledButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 254, 251, 228)),  
                            ),
                            onPressed: _launchURL6,
                            child: Text('Find out', style: 
                            TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 1, 97, 4),
                            ),),
                          ),
                      ]                   
                      ), ),

                   const SizedBox(
                    height: 7,
                  ),
                  
                                   
                    ]),))));}}             
                   
 */

*/

