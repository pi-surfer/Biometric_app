import 'package:flutter/material.dart';
import 'package:app_project/models/project.dart';


class ProjectPage extends StatefulWidget {

  static const routename = 'Projectpage';

  const ProjectPage({
    Key? key,  
  }):super(key: key);

  @override
  State createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {

  final NameProject name = NameProject();
  final IdProject id = IdProject();
  final imagePathProject imagePath = imagePathProject();
  final AddressProject address = AddressProject();
  final PhraseProject phrase = PhraseProject();
  List<bool> light = [false,false,false,false,false];
  int index = 1;

  @override
  Widget build(BuildContext context) {   
    print('${ProjectPage.routename} built');
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 254, 251, 228),
      body: Center( 
        child: ListView.builder(
          itemCount: id.ids.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: ExpansionTile(
                leading: CircleAvatar(backgroundImage: AssetImage(imagePath.images[index])),
                title: Text(name.names[index], style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                subtitle: Text(address.addresses[index], style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                  children: [
                    Text(phrase.descriptions[index]),
                    SwitchListTile(value: light[index], onChanged: (value) {
                      setState(()
                        => light[index] = value
                      );
                    },
                      activeThumbImage: light[index]
                        ? const AssetImage('images/ape_carina2.jpg')
                        : null,),
                  ],
                  childrenPadding: EdgeInsets.all(30),
                  tilePadding: EdgeInsets.all(0),
                  expandedAlignment: Alignment.center,
                  collapsedBackgroundColor: Colors.transparent,
                  collapsedIconColor: Colors.black,
                  backgroundColor: Color.fromARGB(255, 254, 251, 228),
              ),
            );          
          }
        ),
      )
    );
  }
  
  length(id) {
    return length(id);
  }
  
}