import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:app_project/screens/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

int _selIdx = 0;

List<MoltenTab> navBarTabs = [
    MoltenTab(
      icon: Icon(Icons.search),
      selectedColor: Colors.yellow,
    ),
    MoltenTab(
      icon: Icon(Icons.home),
      selectedColor: Colors.yellow,
    ),
    MoltenTab(
      icon: Icon(Icons.person),
      selectedColor: Colors.yellow,
    ),
  ];

void _onTabTapped(int index) {
    setState(() {
      _selIdx = index;
    });
  }

  Widget _selectPage({
    required int index,
  }) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return HomePage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 13, 129, 52),
              ),
              child: Text('My Profile'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('logout'),
              onTap: () => _toLoginPage(context),
            ),
          ],
        ),
      ),
      body: _selectPage(index: _selIdx),
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: Colors.black,
        selectedIndex: _selIdx,
        domeHeight: 25,
        onTabChange: _onTabTapped,
        tabs: navBarTabs,
      ),
    );
  }

  void _toLoginPage(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginPage()));
  } // _toLoginPage
}
