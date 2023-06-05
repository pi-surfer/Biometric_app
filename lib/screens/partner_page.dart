import 'dart:convert';
import 'dart:async';

//import 'package:app_project/widgets/video_widget.dart';
//import 'package:app_project/widgets/video_widget1.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';
import 'package:http/http.dart' as http;
//import 'package:app_project/model/partner.dart';


Uri _urlNike=Uri.parse('https://www.nike.com/it/sostenibilita');
Uri _urlGenerali=Uri.parse('https://www.generali.it/risparmio-investimenti/investimento/generasviluppo-sostenibile');
Uri _urlPatagonia=Uri.parse('https://eu.patagonia.com/gb/en/actionworks/campaigns/?utm_source=patagonia.com&utm_medium=referral&utm_campaign=subnav');


void _launchURL() async {
  if (!await launchUrl(_urlNike)) throw 'Could not launch $_urlNike';}


void _launchURL1() async {
  if (!await launchUrl(_urlGenerali)) throw 'Could not launch $_urlGenerali';}

void _launchURL2() async {
  if (!await launchUrl(_urlPatagonia)) throw 'Could not launch $_urlPatagonia';}


  
class Partner extends StatefulWidget {
  static const route = '/partnerPage/';
  static const routeDisplayName = 'PartnerPage';

  const Partner({Key? key}) : super(key: key);

  @override
  State<Partner> createState() => PartnerState();
}

class PartnerState extends State<Partner> {
  Future<void>? _launched;
  bool _hasCallSupport = false;
  
   
  /*Future <void> readJson() async {
    final String response = await rootBundle.loadString('assets/partner.json');
    final data = await json.decode(response);
    setState (() {
      _partner = data["partner"];
    });
  }*/

  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri()).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  //int _selIdx = 0;

  /*void _onItemTapped(int index) {
    setState(() {
      _selIdx = index;
    });
  }*/

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 254, 251, 228),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 254, 251, 228),
        ),
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
                  
                  Container(
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                image: AssetImage("assets/images/3.jpg"), 
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
                
                  
                  /*Stack(  children: <Widget>[
                    VideoWidget1(),
                    Material(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.transparent,
                        width: 300.0,
                        height: 350.0, 
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Diadora',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 254, 251, 228),
                          ),),
                        Text('INSEGUI I TUOI OBIETTIVI',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        FilledButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 254, 251, 228)),
                              
                            ),
                            onPressed: _launchURL,
                            child: Text('Scopri di più', style: 
                            TextStyle(
                              fontSize: 15.0,
                              color: Color.fromARGB(255, 1, 97, 4),
                            ),),
                          ),
                      ]                   
   ),),),],),*/
   
                
                
                const SizedBox(
                    height: 7,
                  ),
                  
                  Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/gif/patagonia.gif"), 
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



                  /*Stack(  children: <Widget>[
                    
                    VideoWidget(),
                    Material(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.transparent,
                        width: 300.0,
                        height: 350.0, 
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Generali',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 254, 251, 228),
                          ),),
                        Text('TOGETHER FOR HEALTH',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 251, 228),
                        ),),
                        FilledButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 254, 251, 228)),
                              
                            ),
                            onPressed: ,
                            child: Text('For more', style: 
                            TextStyle(
                              fontSize: 15.0,
                              color: Color.fromARGB(255, 1, 97, 4),
                            ),),
                          ),
                      ]                   
   ),),),],),

                    const SizedBox(
                    height: 7,
                  ),*/
                  
                  Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/1.jpg"), 
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
                        image: AssetImage("assets/images/4.jpg"), 
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
                  
                  
                  
                                   
                    ]),))));}}             
                   
 

//columnd(padding(column(space.evenly)