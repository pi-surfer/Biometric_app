import 'package:flutter/material.dart';
import 'package:app_project/models/projects.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProjectItem extends StatefulWidget {
  //final items;
  final String name;
  final String address;
  final String phrase;
  final String imagePath;
  final int projectId;
  bool light;
  bool selected;

  ProjectItem({
    Key? key,
    required this.name, 
    required this.address, 
    required this.phrase, 
    required this.imagePath,
    required this.projectId, 
    this.light=false,
    this.selected=false,
  }) : super(key: key);

  

  @override
  State<StatefulWidget> createState() => _ProjectItemState();

}

class _ProjectItemState extends State<ProjectItem> {
  
  @override
  void initState() {
    super.initState();
  }    

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
                onTap: () {
                  setState(() {
                  widget.selected = !widget.selected;
                  });
                },
                child: Center(
                child: AnimatedContainer(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(color: Color.fromARGB(255, 254, 251, 228), borderRadius: BorderRadius.circular(30)),
                  width: widget.selected ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width,
                  height: widget.selected ? 270 : 100,
                  alignment: widget.selected ? Alignment.center : Alignment.center,
                  duration: const Duration(seconds: 1),
                  child: widget.selected ? Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    width: 300,
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
                                CircleAvatar(backgroundImage: AssetImage(widget.imagePath), maxRadius: 30),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Container(
                                      child: Text(widget.name, style: TextStyle(color: Colors.black,  fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                                  ),
                                  ),
                                  Consumer<SelectedProject>(builder:
                                      ((context, projectProvider, child) {
                                    return Switch(
                                        value: projectProvider
                                            .proj[widget.projectId].light,
                                        onChanged: (bool value) {
                                          projectProvider
                                              .selectProject(widget.projectId);
                                        });
                                  })),
                                ],
                                      
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top:20),
                              child: Text(widget.address, style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.start, maxLines: 1),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top:20),
                              child: Text(widget.phrase, style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.start, maxLines: 4),
                            ),
                          ),
                          
                        ],
                      ),
                    )
                  ) : Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.imagePath), fit: BoxFit.cover, opacity: 0.8), borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(widget.name, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                    ),alignment: Alignment.centerLeft,),
                  ),
                ),
              ),
              SizedBox(
            height: 20,
          )
      ],
    );
  }
}
