import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:app_project/screens/login_page.dart';
import 'package:app_project/screens/home_page.dart';
import 'package:app_project/screens/projects_page.dart';

class SkeletonPage extends StatefulWidget {
  const SkeletonPage({Key? key}) : super(key: key);

  @override
  State createState() => _SkeletonPageState();
}

class _SkeletonPageState extends State<SkeletonPage> {

int _selIdx = 0;

List<MoltenTab> navBarTabs = [
    MoltenTab(
      icon: Icon(MdiIcons.shoeSneaker,size: 30),
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      unselectedColor: Color.fromARGB(255, 255, 255, 255),
    ),
    MoltenTab(
      icon: Icon(Icons.location_pin,size:30),
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      unselectedColor: Color.fromARGB(255, 255, 255, 255),
    ),
    MoltenTab(
      icon: Icon(Icons.home_rounded,size: 30),
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      unselectedColor: Color.fromARGB(255, 255, 255, 255),
    ),
    MoltenTab(
      icon: Icon(Icons.handshake_rounded,size:30),
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      unselectedColor: Color.fromARGB(255, 255, 255, 255),
    ),
    MoltenTab(
      icon: Icon(Icons.qr_code,size: 30),
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      unselectedColor: Color.fromARGB(255, 255, 255, 255),
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
        return ProjectPage();
      case 2:
        return HomePage();
      case 3:
        return LoginPage();
      case 4:
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
                color: Color.fromARGB(255, 130, 204, 34),
              ),
              child: Text('My Profile'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('logout'),
              onTap: () => _toLoginPage(context),),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Profile'),
              onTap: () => _toLoginPage(context),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 130, 204, 34),
        title: Text('SKELETON'),
        ),
      body: _selectPage(index: _selIdx),
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: Color.fromARGB(255, 130, 204, 34),
        domeCircleColor: Colors.white,
        borderRaduis: BorderRadius.circular(15),
        borderColor: Colors.black,
        margin: EdgeInsets.only(bottom: 30, left:12, right: 12),
        curve: Curves.bounceIn,
        selectedIndex: _selIdx,
        domeHeight: 15,
        onTabChange: _onTabTapped,
        tabs: navBarTabs,
        duration: Duration(milliseconds: 200),
      ),
    );
  }

  void _toLoginPage(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginPage()));
  } // _toLoginPage
}
