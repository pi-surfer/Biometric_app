// ignore_for_file: unused_import

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
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController names = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController email = TextEditingController();
    //TextEditingController password = TextEditingController();

  double? bmi;
  String errorText = '';
  String status = '';
  int? radioValue;

  Future<bool> _saveName() async {
    String sp_name = names.text;
    SharedPreferences prefs_name = await SharedPreferences.getInstance();
    return prefs_name.setString('name', sp_name);
  }

  Future<String?> _getName() async{
    SharedPreferences prefs_name = await SharedPreferences.getInstance();
    return prefs_name.getString('name');
  }

  Future<bool> _saveAge() async {
    double? sp_age = double.tryParse(age.value.text);
    SharedPreferences prefs_age = await SharedPreferences.getInstance();
    return prefs_age.setDouble('age', sp_age!);
  }

  Future<double?> _getAge() async{
    SharedPreferences prefs_age = await SharedPreferences.getInstance();
    return prefs_age.getDouble('age');
  }

  Future<bool> _saveEmail() async {
    String sp_mail = email.text;
    SharedPreferences prefs_mail = await SharedPreferences.getInstance();
    return prefs_mail.setString('email', sp_mail);
  }

  Future<String?> _getEmail() async{
    SharedPreferences prefs_mail = await SharedPreferences.getInstance();
    return prefs_mail.getString('email');
  }

  Future<bool> _saveHeight() async{
    final double? sp_height = double.tryParse(_heightController.value.text);
    final prefs_height = await SharedPreferences.getInstance();
    return prefs_height.setDouble('personalHeight', sp_height!);
  }

  Future<double?> _getHeight() async{
    SharedPreferences prefs_height = await SharedPreferences.getInstance();
    return prefs_height.getDouble('personalHeight');
  }
  
  Future<bool> _saveWeight() async{
    final double? sp_weight = double.tryParse(_weightController.value.text);
    final prefs_weight = await SharedPreferences.getInstance();
    return prefs_weight.setDouble('personalWeight', sp_weight!);
  }

  Future<double?> _getWeight() async{
    SharedPreferences prefs_weight = await SharedPreferences.getInstance();
    return prefs_weight.getDouble('personalWeight');
  }

  void calculateBMI() async {
    double? height = await _getHeight();
    double? weight = await _getWeight();
    //final prefs = await SharedPreferences.getInstance();
    //double? height = prefs.getDouble('personalHeight');
    //final sp = await SharedPreferences.getInstance();
    //double? weight = sp.getDouble('personalWeight');
    //final double? height = double.tryParse(_heightController.value.text);
    //final double? weight = double.tryParse(_weightController.value.text);

    if (height == null || weight == null) {
      setState(() {
        errorText = "Please enter your Height and Weight";
      });
      return;
    }

    if (height <= 0 || weight <= 0) {
      setState(() {
        errorText = "Your Height and Weight must be positive numbers";
      });
      return;
    }

    setState(() {
      bmi = weight / pow((height / 100), 2);
      if (bmi! < 18.5) {
        status = "Underweight";
      } else if (bmi! > 18.5 && bmi! < 25) {
        status = 'Normal weight';
      } else if (bmi! > 25 && bmi! < 30) {
        status = 'Pre-Obesity';
      } else if (bmi! > 30 && bmi! < 35) {
        status = 'Obesity class 1';
      } else if (bmi! > 35 && bmi! < 40) {
        status = 'Obesity class 2';
      } else {
        status = 'Obesity class 3';
      }
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
                                      labelText: 'Names',
                                      prefixIcon: Icon(Icons.person),
                                      border: myInputBorder(),
                                      enabledBorder: myInputBorder(),
                                      focusedBorder: myFocusBorder()),
                                ),
                                SizedBox(height: 10,),
                                ElevatedButton(
                                  onPressed: () async{_saveName();},
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
                                TextField(
                                  controller: age,
                                  decoration: InputDecoration(
                                      labelText: 'Age',
                                      prefixIcon: Icon(Icons.people),
                                      border: myInputBorder(),
                                      enabledBorder: myInputBorder(),
                                      focusedBorder: myFocusBorder()),
                                ),
                                SizedBox(height: 10,),
                                ElevatedButton(
                                  onPressed: () async{_saveAge();},
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
                                TextField(
                                  controller: email,
                                  decoration: InputDecoration(
                                      labelText: 'Email',
                                      prefixIcon: Icon(Icons.email),
                                      border: myInputBorder(),
                                      enabledBorder: myInputBorder(),
                                      focusedBorder: myFocusBorder()),
                                ),
                                /*SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  controller: password,
                                  decoration: InputDecoration(
                                      labelText: 'Password',
                                      prefixIcon: Icon(Icons.password),
                                      border: myInputBorder(),
                                      enabledBorder: myInputBorder(),
                                      focusedBorder: myFocusBorder()),
                                ),*/
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () async{_saveEmail();},
                                  child: Text('Update'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 50, 165, 19),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 20),
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
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
                              child: Icon(Icons.edit, size: 30),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 15),
              /*Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(255, 50, 165, 19)),
                      value: 0,
                      groupValue: radioValue,
                      onChanged: (val) {
                        setState(() {
                          radioValue = val;
                        });
                      },
                    ),
                    const Text(
                      'MALE',
                      style: TextStyle(fontSize: 15),
                    ),
                    Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Color.fromARGB(255, 50, 165, 19)),
                        value: 1,
                        groupValue: radioValue,
                        onChanged: (val) {
                          setState(() {
                            radioValue = val;
                          });
                        }),
                    const Text(
                      'FEMALE',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Color.fromARGB(255, 50, 165, 19)),
                        value: 2,
                        groupValue: radioValue,
                        onChanged: (val) {
                          setState(() {
                            radioValue = val;
                          });
                        }),
                    const Text(
                      'N/D',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),*/
              SizedBox(height: 30),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 254, 251, 228),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Column(children: [
                    TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          labelText: 'Height (cm)', suffixText: 'centimeters'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Weight (kg)',
                        suffixText: 'kilograms',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed:()async{ _saveHeight;},
                          child: const Text('Save height'),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 50, 165, 19),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        ElevatedButton(
                          onPressed:() async{ _saveWeight;},
                          child: const Text('Save weight'),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 50, 165, 19),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        ElevatedButton(
                          onPressed: calculateBMI,
                          child: const Text('Calculate'),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 50, 165, 19),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      errorText,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey.shade400,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  bmi == null
                                      ? '00.00'
                                      : bmi!.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 60,
                                      color: status == 'Underweight'
                                          ? Colors.blue
                                          : status == 'Normal weight'
                                              ? Colors.green
                                              : status == 'Pre-Obesity'
                                                  ? Colors.yellow.shade700
                                                  : status == 'Obesity class 1'
                                                      ? Colors.orange
                                                      : status ==
                                                              'Obesity class 2'
                                                          ? Colors
                                                              .deepOrangeAccent
                                                          : status ==
                                                                  'Obesity class 3'
                                                              ? Colors.red
                                                              : null),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      status,
                                      style: TextStyle(
                                          color: status == 'Underweight'
                                              ? Colors.blue
                                              : status == 'Normal weight'
                                                  ? Colors.green
                                                  : status == 'Pre-Obesity'
                                                      ? Colors.yellow.shade700
                                                      : status ==
                                                              'Obesity class 1'
                                                          ? Colors.orange
                                                          : status ==
                                                                  'Obesity class 2'
                                                              ? Colors
                                                                  .deepOrangeAccent
                                                              : status ==
                                                                      'Obesity class 3'
                                                                  ? Colors.red
                                                                  : null),
                                    ),
                                    const Text(
                                      'BMI',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 15.0, // soften the shadow
                                    spreadRadius: 1.0, //extend the shadow
                                    offset: Offset(
                                      5.0, // Move to right 5  horizontally
                                      5.0, // Move to bottom 5 Vertically
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'Nutritional Status',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(15)),
                                      color: Colors.blue,
                                    ),
                                    child: const Center(
                                        child: Text('Underweight',
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.white))),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 25,
                                    color: Colors.green,
                                    child: const Center(
                                        child: Text('Normal \nweight',
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.white))),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 25,
                                    color: Colors.yellow.shade700,
                                    child: const Center(
                                        child: Text('Pre-Obesity',
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.white))),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 25,
                                    color: Colors.orange,
                                    child: const Center(
                                        child: Text('Obesity \nclass 1',
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.white))),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 25,
                                    color: Colors.deepOrangeAccent,
                                    child: const Center(
                                        child: Text('Obesity \nclass 2',
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.white))),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(15)),
                                      color: Colors.red,
                                    ),
                                    child: const Center(
                                        child: Text('Obesity \nclass 3',
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.white))),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('00',
                                    style: TextStyle(
                                      color: Colors.transparent,
                                    )),
                                Text('18.5'),
                                Text('25.0'),
                                Text('30.0'),
                                Text('35.0'),
                                Text('40.0'),
                                Text('00',
                                    style: TextStyle(
                                      color: Colors.transparent,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
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
