import 'package:flutter/material.dart';

import 'package:app_project/screens/login_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routename = 'HomePage';

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(      
      body: Center(
        child: Text('Ciao'),
      ),
    );
  }

  void _toLoginPage(BuildContext context) {
    // pop the drawer first
    Navigator.pop(context);
    // then pop the home page
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
