import 'package:flutter/material.dart';
import 'package:app_project/models/projects.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RewardItem extends StatelessWidget {
  final String name;
  final String qrcode;
  final String phrase;
  final String imagePath;
  
  RewardItem({
    required this.name, 
    required this.qrcode, 
    required this.phrase, 
    required this.imagePath,
  });


@override
  Widget build(BuildContext context) {
    return Column(children: [
      Container( 
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),               
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
                 BoxShadow(
                 color: Colors.black.withOpacity(0.2),
                 offset: const Offset(0, 6),
                 blurRadius: 4,
                            )
                          ],
        borderRadius: BorderRadius.circular(10)), 
        //width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath), 
          fit: BoxFit.cover, opacity: 4),
              
            )
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Text(name,
              textAlign: TextAlign.center,
              style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              ),),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Text(phrase,
            textAlign: TextAlign.center,
              style: const TextStyle(
              fontSize: 16,
              
              color: Colors.black,
              ),),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(qrcode), 
                  fit: BoxFit.fill)),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.015),  
            ]                   
            ), ),
    ]
    );
    }
     
  }


  
