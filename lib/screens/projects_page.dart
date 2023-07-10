import 'package:app_project/models/projects.dart';
import 'package:app_project/provider/projects_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

<<<<<<< HEAD
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';

class ProjectsPage extends StatefulWidget {
  //const ProjectPage({Key? key}) : super(key: key);

  static const routename = 'Projectpage_bis';
=======

class ProjectsPage extends StatefulWidget {

  static const routename = 'Projectspage';
>>>>>>> origin/project-page

  const ProjectsPage({
    Key? key,  
  }):super(key: key);

  @override
  State createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
<<<<<<< HEAD
  final List<Projects> projects = getProject();
  //final Projects projects = Projects(id:1,name:'x',phrase:'x',imagePath:'x', value:false,selected:false, address: 'x');


  final List<int> lista = [1,2,3,4,5,6,7,8,9];
  bool toggled_1 = false;
  bool toggled_2 = false;
  bool toggled_3 = false;
  bool light_1 = false;
  bool light_2 = false;
  bool selected_1 = false;
  bool selected_2 = false;
  
  get project => projects.map((e){return Projects(id: e.id, name: e.name, address: e.address, phrase: e.phrase, imagePath: e.imagePath, light: e.light, selected: e.selected);});

 /* @override
  void initState() {
    final items = projects.map((item) {_ProjectItemState(name: item.name, address: item.address, phrase: item.phrase, 
    imagePath: item.imagePath, light: item.light, selected: item.selected);});
  }
 */

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
    
    print('${ProjectsPage.routename} built');
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20), bottomRight:Radius.circular(20)))
      ),

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
                            leading: CircleAvatar(backgroundImage: AssetImage('images/miele_Dario.jpg')),
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
                                  ? const AssetImage('images/ape_carina2.jpg')
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

            //SizedBox(
              //height: 20
            //),
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
            */
        ]
        ),*/
    )
    );
    //  );
  }
  
}*/
=======

  
  final IdProject id = IdProject();
  List<bool> light = [false,false,false,false,false];
  List<bool> selected = [false,false,false,false,false];
  int index = 1;
  final List<Projects> projects = getProject();
  

  @override
  Widget build(BuildContext context) {  
    print('${ProjectsPage.routename} built');
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 254, 251, 228),
      body: Center( 
        child: ListView.builder(
          itemCount: id.ids.length,
          itemBuilder: (context, index) {
            return ProjectItem(name: projects[index].name, address: projects[index].address, phrase: projects[index].phrase, imagePath: projects[index].imagePath);
          }
        )
      )
    );
  }
}
>>>>>>> origin/project-page
