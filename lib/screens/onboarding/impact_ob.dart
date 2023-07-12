import 'dart:math';

import 'package:app_project/models/CustomClipper.dart';
import 'package:flutter/material.dart';
import 'package:app_project/screens/skeleton_page.dart';
import 'package:app_project/services/impact.dart';
import 'package:provider/provider.dart';

// COPIATO PARI PARI, DA MODIFICARE

class ImpactOnboarding extends StatefulWidget {
  static const route = '/impact/';
  static const routeDisplayName = 'ImpactOnboardingPage';

  ImpactOnboarding({Key? key}) : super(key: key);

  @override
  State<ImpactOnboarding> createState() => _ImpactOnboardingState();
}

class _ImpactOnboardingState extends State<ImpactOnboarding> {
  static bool _passwordVisible = false;
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _showPassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  Future<bool> _loginImpact(
      String name, String password, BuildContext context) async {
    ImpactService service = Provider.of<ImpactService>(context, listen: false);
    bool logged = await service.getTokens(name, password);
    return logged;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 251, 228),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Form(
          key: _formKey,
          child: Container(
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255,255, 114, 106),
                            ),
                            children: [
                              TextSpan(
                                text: '2',
                                style: TextStyle(color: Color.fromARGB(255, 255, 221, 74), fontSize: 18),
                              ),
                              TextSpan(
                                text: 'Seed',
                                style: TextStyle(color: Color.fromARGB(255,50, 165, 19), fontSize: 18),
                              ),
                            ]),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Impact',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 1, 97, 4),
                            ),)),
                      SizedBox(height: 50),
          Column(
            children: <Widget>[
              const Text('Please authorize to use our app',
                  style: TextStyle(
                    fontSize: 16,
                  )),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('Username',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 7,
              ),
              TextFormField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Username is required';
                  }
                  return null;
                },
                controller: userController,
                cursorColor: const Color.fromARGB(255, 1, 97, 4),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  hintText: 'Username',
                  hintStyle: const TextStyle(color: const Color.fromARGB(255, 1, 97, 4)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('Password',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 7,
              ),
              TextFormField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
                controller: passwordController,
                cursorColor: const Color.fromARGB(255, 1, 97, 4),
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
                      // Based on passwordVisible state choose the icon
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
                  hintStyle: const TextStyle(color: const Color.fromARGB(255, 1, 97, 4)),
                ),
              ),
              //const Spacer(),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? validation = await _loginImpact(userController.text,
                          passwordController.text, context);
                      if (!validation) {
                        // if not correct show message
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Color.fromARGB(255,255, 114, 106),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(8),
                          content: Text('Wrong Credentials'),
                          duration: Duration(seconds: 2),
                        ));
                      } else {
                        await Provider.of<ImpactService>(context, listen: false)
                            .getPatient();
                        Future.delayed(
                              const Duration(milliseconds: 300),
                              () => Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const SkeletonPage())));

                      }
                    },
                    style: ButtonStyle(
                        //maximumSize: const MaterialStatePropertyAll(Size(50, 20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        elevation: MaterialStateProperty.all(0),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 20)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Color.fromARGB(255, 254, 251, 228)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 1, 97, 4))),
                    child: const Text('Authorize', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
          
                  ]
                  
        ),
      ),
    )
    ]
                ),
          ),
        ),
      )
    );
  }
}
