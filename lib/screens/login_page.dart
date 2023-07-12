import 'package:app_project/models/CustomClipper.dart';
import 'package:app_project/screens/home_page.dart';
import 'package:app_project/screens/onboarding/impact_ob.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'authentication.dart';
import 'package:flutter/services.dart';

import 'package:app_project/utils/shared_preferences.dart';

import 'dart:math';

import 'package:app_project/screens/signup_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);



  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  static bool _passwordVisible = false;
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void _showPassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 251, 228),
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -MediaQuery.of(context).size.height * .15,
            right: -MediaQuery.of(context).size.width * .4,
            child: Container(
                child: Transform.rotate(
              angle: -pi / 3.5,
              child: ClipPath(
                clipper: ClipPainter(),
                child: Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 255, 221, 74),
                        Color.fromARGB(255, 253, 176, 120),
                      ],
                    ),
                  ),
                ),
              ),
            )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Fit',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255,255, 114, 106),
                        ),
                        children: [
                          TextSpan(
                            text: '2',
                            style: TextStyle(color: Color.fromARGB(255, 255, 221, 74), fontSize: 30),
                          ),
                          TextSpan(
                            text: 'Seed',
                            style: TextStyle(color: Color.fromARGB(255,50, 165, 19), fontSize: 30),
                          ),
                        ]),
                  ),
                  SizedBox(height: 50),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Username",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username is required';
                                } else if (value != 'username') {
                                  return 'Username is wrong';
                                }
                              return null;
                            },),
                            SizedBox(
                              height: 10,
                            ),
                            /*TextField(
                                obscureText: false,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Color.fromARGB(100, 255, 221, 74),
                                    filled: true))*/
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                } else if (value != 'password') {
                                  return 'Password is wrong';
                                }
                                return null;
                              },
                              controller: passwordController,
                              cursorColor: const Color.fromARGB(255, 1, 97, 4),
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                             ),
                              border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                              ),
                              suffixIcon: IconButton(
                              icon: Icon(
                              _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                              color: Colors.grey,
                              ),
                              onPressed: () {
                                _showPassword();
                              },
                              ),
                              hintText: 'Password',
                              hintStyle: const TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            /*TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Color.fromARGB(100, 255, 221, 74),
                                    filled: true))*/
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            var prefs =
                              Provider.of<Preferences>(context, listen: false);
                            prefs.username = userController.text;
                            prefs.password = passwordController.text;
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => HomePage()));
                          }
                        },
                        style: ButtonStyle(
                        //maximumSize: const MaterialStatePropertyAll(Size(50, 20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        elevation: MaterialStateProperty.all(0),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 12)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Color.fromARGB(255, 254, 251, 228)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 1, 97, 4))),
                      child: const Text('Log In'),
                  ),
                ),
              ),
                  SizedBox(height: height * .055),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Don\'t have an account ?',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Register',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 97, 4),
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}