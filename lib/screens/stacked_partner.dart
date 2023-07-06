import 'package:flutter/material.dart';
import 'package:app_project/model/partner.dart';


//GESTISCE LA VISUALIZZAZIONE DELLE CARTE
class PartnerItem extends StatelessWidget {
  final String name;
  final String phrase;
  final String imagePath;
  
  //final Uri url;

  PartnerItem({
    required this.name,
    required this.phrase,
    //required this.url,
    required this.imagePath,
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
      margin: const EdgeInsets.only(top: 2.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath), 
          fit: BoxFit.cover, opacity: 5), 
          borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width *0.97,
        height: 400,
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
              style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 254, 251, 228)),  
              ),
            onPressed: (){},
            //_launchURL6,
            child: const Text('Find out', style: 
              TextStyle(
                fontSize: 16.0,
                color: Color.fromARGB(255, 1, 97, 4),
            ),),
            ),
            ]                   
            ), ),

        //const SizedBox(
          //height: 1,
          //),

    ]








        
            
            
        );
}
}
