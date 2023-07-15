import 'dart:math';

import 'package:app_project/models/projects.dart';
import 'package:app_project/screens/login_page.dart';
import 'package:app_project/screens/reward_page.dart';
import 'package:app_project/screens/training_page.dart';
import 'package:app_project/widgets/funky_overlay.dart';
import 'package:flutter/material.dart';

import 'package:app_project/screens/skeleton_page.dart';
import 'package:app_project/screens/login/login_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO: CONTROLLARE SHARED PREFERENCES!! LE PARTI COMMENTATE CON LA NAVIGATION VERSO L'ACTIVITY E LA REWARD DOVREBBERO PASSARE PRIMA PER LA SKELETON
// PERCHE' SENNO' RIMANDA ALLE PAGINE SENZA LA BOTTOMNAVIGATION
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const routename = 'Profilepage';

  @override
  State createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController names = TextEditingController();

  

  Future<bool> _saveName() async {
    String sp_name = names.text;
    SharedPreferences prefs_name = await SharedPreferences.getInstance();
    return prefs_name.setString('name', sp_name);
  }

  String? name;
  late SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    pref= await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('name');
      if (name == null) { name = 'name';}
    });
  }

  
  

  @override
  Widget build(BuildContext context) {
    print('${ProfilePage.routename} built');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 254, 251, 228),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 20),
                  child: Stack(children: [
                    Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 80, left: 20, right: 20),
                      //width: 400,
                      height: 475,
                      width: MediaQuery.of(context).size.width,
                      //height: MediaQuery.of(context).size.width*0.6,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 254, 251, 228),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding:
                                EdgeInsets.only(top: 80, left: 20, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextField(
                                  controller: names,
                                  decoration: InputDecoration(
                                      labelText: '$name',
                                      prefixIcon: Icon(Icons.person),
                                      border: myInputBorder(),
                                      enabledBorder: myInputBorder(),
                                      focusedBorder: myFocusBorder()),
                                ),
                                SizedBox(height: 10,),
                                ElevatedButton(
                                  onPressed: () async{_saveName();
                                  //print('ciao' + _getName().toString());
                                  },
                                  child: Text('Update'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 50, 165, 19),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 20),
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          ClipOval(
                              child: Image.asset(
                                  'assets/images/avatar_Carciofo.jpg',
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover)),
                          Positioned(
                            bottom: 5,
                            right: 15.5,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              //child: Icon(Icons.edit, size: 30),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 30),
              Consumer<SelectedProject>(builder: (context, project, child) {
                if (project.getSelectedProject() >= 0) {
                  Projects selectedProject =
                      project.proj[project.getSelectedProject()];
                  debugPrint('${project.getSelectedProject()}');
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                          barrierColor: const Color.fromARGB(255, 56, 56, 56)
                              .withOpacity(0.3),
                          context: context,
                          builder: (_) {
                            return FunkyOverlay(
                              mainImage: AssetImage(selectedProject.imagePath),
                              title: selectedProject.name,
                              subtitle: selectedProject.address,
                              body: selectedProject.phrase,
                              isSelected: selectedProject.light,
                            );
                          });
                    },
                    child: Container(
                      height: 200.0,
                      width: 400.0,
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(selectedProject.imagePath),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        /*border: Border.all(
                                  width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),*/
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(selectedProject.name,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                background: Paint()
                                  ..color = Colors.black.withOpacity(0.4)
                                  ..style = PaintingStyle.fill,
                              )),
                          Text(selectedProject.address,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                background: Paint()
                                  ..color = Colors.black.withOpacity(0.4)
                                  ..style = PaintingStyle.fill,
                              )),
                          SizedBox(height: 15)
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container(
                      height: 200.0,
                      width: 400.0,
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        /*border: Border.all(
                                  width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),*/
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Center(
                        child: Text('No project was selected'),
                      ));
                }
              }),
              /*SizedBox(height: 30),
              Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 254, 251, 228),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      border: Border.all(
                        color: Colors.grey.shade400,
                      )),
                  child: Row(children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RewardPage()));
                        },
                        icon: Icon(MdiIcons.crown,
                            color: Color.fromARGB(255, 1, 97, 4), size: 18)),
                    Text('YOUR MISSIONS AND REWARDS',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ])),
              SizedBox(height: 30),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 254, 251, 228),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: Colors.grey.shade400,
                    )),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Activity()));
                        },
                        icon: Icon(Icons.fitness_center,
                            color: Color.fromARGB(255, 1, 97, 4), size: 18)),
                    Text('YOUR WEEKLY ACTIVITY',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),*/
              SizedBox(height: 30),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 254, 251, 228),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: Colors.grey.shade400,
                    )),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => SkeletonPage()));
                        },
                        icon: Icon(Icons.home,
                            color: Color.fromARGB(255, 1, 97, 4), size: 18)),
                    Text('Back to Home',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder myInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.black,
          width: 3,
        ));
  }

  OutlineInputBorder myFocusBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 3,
        ));
  }

  void _toLoginPage(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  } // _toLoginPage

  void _toHomePage(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SkeletonPage()));
  } // _toLoginPage

}
