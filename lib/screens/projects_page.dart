import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  static const routename = 'Projectpage';

  @override
  State createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final List<int> lista = [1,2,3,4,5,6,7,8,9];




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
    print('${ProjectPage.routename} built');
    return Scaffold(
        appBar: AppBar(
        leadingWidth: 50,
        title: Text('Project', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: Icon(Icons.account_circle),
        actions: [
            const Icon(Icons.access_time)
      ],
        automaticallyImplyLeading: false, // per tornare indietro con la navigazione
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 130, 204, 34),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              
              child: ListView(
                children: [
                  for(var i in lista)
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: ExpansionTile(
                            leading: CircleAvatar(backgroundImage: AssetImage('images/miele_Dario.jpg')),
                                title: Text('Miele di Dario', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                                //leading: Icon(Icons.info),
                                children: [
                                  Text('Api di Dario è un bellissimo luogo in cui moltissime api risiedono in splendide arnie'),
                                       
                                   
                              
                                ],
                                childrenPadding: EdgeInsets.all(30),
                                tilePadding: EdgeInsets.all(20),
                                expandedAlignment: Alignment.center,
                                collapsedBackgroundColor: Color.fromARGB(114, 255, 236, 66),
                                collapsedIconColor: Colors.black,
                                backgroundColor: Colors.white,
                                ),
                        )
                      ],
                    ),
                  ),

              SizedBox(
                height: 20
              ),
              Container(
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
              )
          ]
          ),
      )
        );
  }
}