import 'package:app_project/models/projects.dart';
import 'package:app_project/models/widgetProject.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProjectsPage extends StatefulWidget {
  static const routename = 'Projectspage';

  const ProjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  State createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  //final IdProject id = IdProject();
  List<bool> light = [false, false, false, false, false];
  List<bool> selected = [false, false, false, false, false];
  int index = 1;
  final List<Projects> projects = getProject();

  @override
  Widget build(BuildContext context) {
    print('${ProjectsPage.routename} built');
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      
        child: Scaffold(
          
            backgroundColor: Color.fromARGB(255, 254, 251, 228),
            body: Padding(
              padding: const EdgeInsets.only(top: 30, left:8.0,right:8.0),
              child: Center(
                  child: ListView.builder(
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        return ProjectItem(
                            projectId: projects[index].id,
                            name: projects[index].name,
                            address: projects[index].address,
                            phrase: projects[index].phrase,
                            imagePath: projects[index].imagePath);
                      })),
            )),
    );
  }
}
