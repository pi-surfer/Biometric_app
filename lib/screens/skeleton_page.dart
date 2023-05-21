import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:app_project/screens/login_page.dart';
import 'package:app_project/screens/home_page.dart';
import 'package:app_project/screens/projects_page.dart';
import 'package:app_project/screens/training_page.dart';
import 'package:app_project/screens/partner_page.dart';

class SkeletonPage extends StatefulWidget {
  SkeletonPage({Key? key}) : super(key: key);

  @override
  State createState() => _SkeletonPageState();
}

class _SkeletonPageState extends State<SkeletonPage> {

int _selIdx = 0;
final navigationKey = GlobalKey<CurvedNavigationBarState>();

// To use it:
// onPressed: () {final _navigationSate = navigationKey.currentState!;
// _navigationState.setPage(0);
// }
// ref: https://www.youtube.com/watch?v=TX2x41h47fE

List<Widget> navBarItems = [
    const Icon(MdiIcons.run,size: 30,color: Colors.black,),
    const Icon(Icons.location_pin,size:30,color: Colors.black,),
    const Icon(Icons.home_rounded,size: 30,color: Colors.black,),
    const Icon(Icons.handshake_rounded,size:30,color: Colors.black,),
    const Icon(Icons.qr_code,size: 30,color: Colors.black,),
  ];

void _onItemTapped(int index) {
    setState(() {
      _selIdx = index;
    });
  }

  Widget _selectPage({
    required int index,
  }) {
    switch (index) {
      case 0:
        return Activity();
      case 1:
        return const ProjectPage();
      case 2:
        return const HomePage();
      case 3:
        return const Partner();
      case 4:
        return const HomePage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: ClipRect(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 173, 254, 178),
          extendBody: true,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 39, 145, 43),
                  ),
                  child: Text('My Profile'),
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('logout'),
                  onTap: () => _toLoginPage(context),),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Profile'),
                  onTap: () => _toLoginPage(context),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 90, 146, 17),
            title: const Text('SKELETON'),
            ),
          body: _selectPage(index: _selIdx),
          
          /*bottomNavigationBar: MoltenBottomNavigationBar(
            barColor: Color.fromARGB(255, 90, 146, 17),
            domeCircleColor: Colors.white,
            barHeight: 70,
            borderRaduis: BorderRadius.circular(5),
            margin: EdgeInsets.only(bottom: 0),
            domeHeight: 15,
            duration: Duration(milliseconds: 200),
            curve: Curves.bounceIn,
            selectedIndex: _selIdx,
            onTabChange: _onTabTapped,
            tabs: navBarTabs,
          ),*/
          
          bottomNavigationBar: CurvedNavigationBar(
            key: navigationKey,
            backgroundColor: Colors.transparent,
            color: const Color.fromARGB(255, 39, 145, 43),
            buttonBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
            height: 70,
            animationCurve: Curves.easeIn,
            animationDuration: const Duration(milliseconds: 400),
            items: navBarItems,
            index: _selIdx,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  void _toLoginPage(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginPage()));
  } // _toLoginPage
}
