import 'package:app_project/models/projects.dart';
//import 'package:app_project/provider/projects_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/foundation.dart';
//import 'package:provider/provider.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';

class ProjectPage extends StatefulWidget {
  //const ProjectPage({Key? key}) : super(key: key);

  static const routename = 'Projectpage';
  final List<Projects> projects;

  const ProjectPage({
    Key? key,
    this.projects = const[],
  }):super(key: key);

  @override
  State createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final List<int> lista = [1,2,3,4,5,6,7,8,9];
  bool toggled_1 = false;
  bool toggled_2 = false;
  bool toggled_3 = false;




 /* @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  int _counter = 0;
  List<int> lista = [1, 2, 3, 4, 5, 6];

  void _incrementCounter() {
    setState(() {
      _counter++;
    })
  }
} */



  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<ProjectProvider>(context);
    print('${ProjectPage.routename} built');
    return Scaffold(

      backgroundColor: const Color.fromARGB(255, 254, 251, 228),  

      // TODO: figure out errors
      body: SingleChildScrollView(
        child: Column(
          //children: Projects.map((projects) {
              //return ExpansionTile(title: Projects.name),
            //})
          children: [
            //projects.map((projects) {
              //return 
            //})
            SizedBox(
              height: 700,
              
              child: ListView(
                children: [
                  // ignore: unused_local_variable
                  for(var i in lista)
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: ExpansionTile(
                            //title: Container(
                             //decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/miele_dario.jpg"), fit: BoxFit.cover)),
                             //child: Text('Miele di Dario', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),),
                            leading: CircleAvatar(backgroundImage: AssetImage('assets/images/miele_Dario.jpg')),
                            //title: Image.asset("assets/images/miele_dario.jpg", 
                            //height: 80.0, 
                            //width: double.infinity, 
                            //alignment: Alignment.center,
                            //fit: BoxFit.cover,),
                            title: Text('Miele di Dario', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                                //leading: Icon(Icons.info),
                                //subtitle: Text('Miele di Dario', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                                children: [
                                  Text('Api di Dario è un bellissimo luogo in cui moltissime api risiedono in splendide arnie'),
                                  SwitchListTile(value: toggled_1, onChanged: (value) {
                                    setState(()
                                      => toggled_1 = value
                                    );
                                  },
                                  activeThumbImage: toggled_1
                                  ? const AssetImage('assets/images/ape_carina2.jpg')
                                  : null,),
                                  //ButtonBar(
                                    //children: Radio())
                                  ],
                                childrenPadding: EdgeInsets.all(30),
                                tilePadding: EdgeInsets.all(0),
                                expandedAlignment: Alignment.center,
                                collapsedBackgroundColor: Colors.transparent,
                                collapsedIconColor: Colors.black,
                                backgroundColor: Color.fromARGB(255, 254, 251, 228),
                                ),
                        )
                      ],
                    ),
                  ),

              SizedBox(
                height: 20
              ),
              /*Container(
                height: 400,
                width: 400,
                color: Colors.grey,
                child:(
                  TextButton(onPressed: () async {
                    final String url = "https://google.it/maps/@45.4536359,12.1652894,14z";
                    if (await canLaunchUrlString(url)) {
                      launchUrlString(url);
                    }
                  },
                  child: Text('Open Maps',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),)
                  )
                )
              )*/
          ]
          ),
      )
        );
  }
}