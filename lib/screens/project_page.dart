import 'package:app_project/models/projects.dart';
import 'package:app_project/models/widgetProject.dart';
import 'package:flutter/material.dart';


class ProjectPage extends StatefulWidget {

  static const routename = 'Projectpage';

  const ProjectPage({
    Key? key,  
  }):super(key: key);

  @override
  State createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final List<Projects> projects = getProject();


  final List<int> lista = [1,2,3,4,5,6,7,8,9];
  bool toggled_1 = false;
  bool toggled_2 = false;
  bool toggled_3 = false;
  bool light_1 = false;
  bool light_2 = false;
  bool selected_1 = false;
  bool selected_2 = false;
  
  get project => projects.map((e){return Projects(id: e.id, name: e.name, address: e.address, phrase: e.phrase, imagePath: e.imagePath, light: e.light, selected: e.selected);});




  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<ProjectProvider>(context);
    
    print('${ProjectPage.routename} built');
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 254, 251, 228),

    body: SingleChildScrollView(
      //)
      /*Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //children: Projects.map((projects) {
            //return ExpansionTile(title: Projects.name),
          //})
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
              selected_1 = !selected_1;
              });
            },
            child: Center(
            child: AnimatedContainer(
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(color: Color.fromARGB(255, 254, 251, 228), borderRadius: BorderRadius.circular(30)),
              width: selected_1 ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width,
              height: selected_1 ? 270 : 100,
              //color: selected_1 ? Color.fromARGB(255, 254, 251, 228) : Colors.white,
              alignment: selected_1 ? Alignment.center : Alignment.center,
              duration: const Duration(seconds: 1),
              child: selected_1 ? Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                //constraints: BoxConstraints(maxWidth: 500),
                width: 300,
                //width: MediaQuery.of(context).size.width,
                height: 300,
                padding: EdgeInsets.only(left:10, right: 10, top: 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 270,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            CircleAvatar(backgroundImage: AssetImage('assets/images/radicchio_Andrea.jpg'), maxRadius: 30),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Container(
                                  child: Text('Radicchio di Andrea', style: TextStyle(color: Colors.black,  fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                              ),
                            ),
                            Switch(value: light_1, onChanged: (bool value) {
                              setState(() {
                                light_1 = value;
                              });
                            }),  
                          ],
                                  
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top:20),
                          child: Text('Address', style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.start, maxLines: 1),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top:20),
                          child: Text('Radicchio di Andrea è un bellissimo luogo da visitare e scoprire', style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.start, maxLines: 4),
                        ),
                      ),
                      /*Expanded(
                        child: Switch(value: light, onChanged: (bool value) {
                          setState(() {
                            light = value;
                          });
                        }),
                      ),*/
                    ],
                  ),
                )
              ) : Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/radicchio_Andrea.jpg"), fit: BoxFit.cover, opacity: 0.8), borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Radicchio di Andrea', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                ),alignment: Alignment.centerLeft,),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
              selected_2 = !selected_2;
              });
            },
            child: Center(
            child: AnimatedContainer(
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(color: Color.fromARGB(255, 254, 251, 228), borderRadius: BorderRadius.circular(30)),
              width: selected_2 ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width,
              height: selected_2 ? 270 : 100,
              //color: selected_2 ? Color.fromARGB(255, 254, 251, 228) : Colors.white,
              alignment: selected_2 ? Alignment.center : Alignment.center,
              duration: const Duration(seconds: 1),
              child: selected_2 ? Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                //constraints: BoxConstraints(maxWidth: 500),
                width: 300,
                //width: MediaQuery.of(context).size.width,
                height: 300,
                padding: EdgeInsets.only(left:10, right: 10, top: 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 270,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            CircleAvatar(backgroundImage: AssetImage('assets/images/miele_Dario.jpg'), maxRadius: 30),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Container(
                                  child: Text('Api di Dario', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
                              ),
                            ),
                            Switch(value: light_2, onChanged: (bool value) {
                              setState(() {
                                light_2 = value;
                              });
                            }),
                            ],          
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top:20),
                          child: Text('Address', style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.start, maxLines: 1),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top:20),
                          child: Text('Api di Dario è un bellissimo luogo in cui moltissime api risiedono in splendide arnie', style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.start, maxLines: 4),
                        ),
                      ),
                      /*Expanded(
                        child: Switch(value: light, onChanged: (bool value) {
                          setState(() {
                            light = value;
                          });
                        }),
                      ),*/
                    ],
                  ),
                )
              ) : Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/miele_Dario.jpg"), fit: BoxFit.cover, opacity: 0.8), borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Api di Dario', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                ),alignment: Alignment.centerLeft,),
              ),
            ),
          ),
          */
            
            child: ListView(
              children: [
                // ignore: unused_local_variable
                for(var index in lista)


                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: ExpansionTile(
                          //title: Container(
                           //decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/miele_dario.jpg"), fit: BoxFit.cover)),
                           //child: Text('Miele di Dario', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),),
                          leading: CircleAvatar(backgroundImage: AssetImage(project.imagePath[index])),
                          //title: Image.asset("assets/images/miele_dario.jpg", 
                          //height: 80.0, 
                          //width: double.infinity, 
                          //alignment: Alignment.center,
                          //fit: BoxFit.cover,),
                          title: Text(project.name[index], style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                              //leading: Icon(Icons.info),
                              subtitle: Text(project.address[index], style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                              children: [
                                Text('Api di Dario è un bellissimo luogo in cui moltissime api risiedono in splendide arnie'),
                                SwitchListTile(value: project.light[index], onChanged: (value) {
                                  setState(()
                                    => project.light[index] = value
                                  );
                                },
                                activeThumbImage: project.light[index]
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
            
        
        );
    //  );
  }
  
}