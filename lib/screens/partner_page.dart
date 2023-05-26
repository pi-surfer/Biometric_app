import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Partner extends StatefulWidget {
  static const route = '/partner/';
  static const routeDisplayName = 'Partner';

  const Partner({Key? key}) : super(key: key);

  @override
  State<Partner> createState() => PartnerState();
}

List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.mapMarkerOutline),
      label: 'Activity',
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.tractor),
      label: 'Firm',
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.homeOutline),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.humanQueue),
      label: 'Partner',
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.shoppingOutline),
      label: 'Promo',
    ),
  ];

class PartnerState extends State<Partner> {
  //int _selIdx = 0;

  /*void _onItemTapped(int index) {
    setState(() {
      _selIdx = index;
    });
  }*/
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 254, 251, 228),
        /*appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 4, 84, 6),
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 254, 251, 228)),
          //title: const Text('OUR PARTNERS', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                  onPressed: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => Profile()));
                  */},
                  
                  icon: const Icon(
                    MdiIcons.circleBox,
                    size: 40,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),

            )
          ],
        ),*/
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
                        color: Color.fromARGB(255, 3, 66, 5),
                        //fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  
                  const SizedBox(
                    height: 20,
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                    children: [
                    Container(
                      width: 150.0,
                      height: 150.0,
                      child: 
                        Image.asset("assets/images/google.jpg", fit:BoxFit.contain, ),),
                      
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: 
                        Image.asset("assets/images/generali.jpg", fit:BoxFit.contain,),),   
                  ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: 
                        Image.asset("assets/images/nike.jpg", fit:BoxFit.contain,),),
                                                                              
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: 
                        Image.asset("assets/images/diadora.jpg", fit:BoxFit.contain, ),),                    
                  ],
                  ),
                ],  
               
          ),),
        


          ),),);   
                   
  }}

//columnd(padding(column(space.evenly