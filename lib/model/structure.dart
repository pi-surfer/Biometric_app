import 'package:flutter/material.dart';
//import 'package:app_project/model/partner.dart';
import 'package:url_launcher/url_launcher.dart';


//import 'package:flutter/semantics.dart';

class Structure extends StatefulWidget {
  final int id;
  final String name;
  final Uri url;
  final String phrase;
  final AssetImage image;
  

  const Structure({
    Key? key,
    required this.id,
    required this.name,
    required this.url,
    required this.phrase,
    required this.image,
  }): super(key: key);

  @override
  State<StatefulWidget> createState() => _Structure();
}

class _Structure extends State<Structure>
    with SingleTickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: widget.image, 
              fit: BoxFit.cover), 
            borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(10),
            width: 400.0,
            height: 400.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(widget.name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 254, 251, 228),
                  ),),
                Text(widget.phrase,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 254, 251, 228),
                ),),
                FilledButton(
                  onPressed: () async {
                    if (await canLaunchUrl(widget.url)) {
                      launchUrl(widget.url);
                    }
                  },
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
                )),
                
                             
  ));}}