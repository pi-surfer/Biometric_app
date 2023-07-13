import 'package:flutter/material.dart';
import 'package:app_project/models/projects.dart';
import 'package:provider/provider.dart';
import 'package:app_project/models/text_styles.dart';

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
                  margin: EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(color: Color.fromARGB(255, 254, 251, 228), borderRadius: BorderRadius.circular(30)),
                  width: widget.selected ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width,
                  height: widget.selected ? MediaQuery.of(context).size.height*0.5 : MediaQuery.of(context).size.height*0.15,
                  alignment: widget.selected ? Alignment.center : Alignment.center,
                  duration: const Duration(seconds: 1),
                  child: widget.selected ? Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.8,
                    padding: EdgeInsets.only(left:8, right: 8, top: 15),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.5,
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
                                      child: Text(widget.name, style: projectSubTitleStyle)),
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
                              padding: const EdgeInsets.only(top:10),
                              child: Text(widget.address, style: bodyStyle, textAlign: TextAlign.start, maxLines: 1),
                            ),
                          ),
                          Expanded(
                            child: 
                            //Padding(
                              //padding: const EdgeInsets.only(top:5),
                              //child: 
                              Text(widget.phrase, style: bodyStyle, textAlign: TextAlign.start, maxLines: 6),
                            ),
                          //),
                          SizedBox(height: 30),
                        ],
                      ),
                    )
                  ) : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.15,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.imagePath), fit: BoxFit.cover, opacity: 0.8), borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding:  EdgeInsets.all(8),
                      child: Text(widget.name, style: projectTitleStyle),
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
