import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_project/screens/login/login_page.dart';
import 'package:app_project/screens/home_page.dart';
import 'package:app_project/screens/projects_page.dart';
import 'package:app_project/screens/training_page.dart';
import 'package:app_project/screens/partner_page.dart';
import 'package:app_project/screens/profile_page.dart';
import 'package:app_project/screens/reward_page.dart';

class SkeletonPage extends StatefulWidget {
  const SkeletonPage({Key? key}) : super(key: key);

  @override
  State createState() => _SkeletonPageState();
}

class _SkeletonPageState extends State<SkeletonPage>
    with SingleTickerProviderStateMixin {
  int _selIdx = 0;
  final controller = ScrollController();

  List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.home),
      label: 'Home',
      backgroundColor: Color.fromARGB(255, 1, 97, 4),
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.googleFit),
      label: 'Activity',
      backgroundColor: Color.fromARGB(255, 1, 97, 4),
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.sprout),
      label: 'Projects',
      backgroundColor: Color.fromARGB(255, 1, 97, 4),
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.handshake),
      label: 'Partners',
      backgroundColor: Color.fromARGB(255, 1, 97, 4),
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.medal),
      label: 'Rewards',
      backgroundColor: Color.fromARGB(255, 1, 97, 4),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selIdx = index;
      scrollUp();
    });
  }

  Widget _selectPage({
    required int index,
  }) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return Activity();
      case 2:
        return ProjectPage();
      case 3:
        return Partner();
      case 4:
        return RewardPage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        left: false,
        right: false,
        child: ClipRect(
          child: Container(
            color: const Color.fromARGB(255, 254, 251, 228).withOpacity(1),
            child: SafeArea(
              child: Scaffold(
                extendBody: true,
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/garden.png'),
                        fit: BoxFit.cover,
                      ),
                          
                        ),
                        child: Text(''),
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout, size: 30),
                        title: const Text('logout',
                            style: TextStyle(fontSize: 16)),
                        onTap: () => _toLoginPage(context),
                      ),
                      ListTile(
                        leading: const Icon(Icons.person, size: 30),
                        title: const Text('Profile',
                            style: TextStyle(fontSize: 16)),
                        onTap: () => _toProfilePage(context),
                      ),
                    ],
                  ),
                ),
                body: NestedScrollView(
                  controller: controller,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        pinned: false,
                        floating: true,
                        forceElevated: true,
                        leading: Builder(builder: (context) {
                          return IconButton(
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer(),
                              icon: const Icon(MdiIcons.viewHeadline,
                                  color: Color.fromARGB(255, 1, 97, 4),
                                  size: 35));
                        }),
                        backgroundColor:
                            const Color.fromARGB(255, 254, 251, 228),
                        centerTitle: true,
                        title: SizedBox(
                          width: 150.0,
                          height: 50.0,
                          child: Image.asset(
                            "assets/images/nome.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ];
                  },
                  body: _selectPage(index: _selIdx),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: Color.fromARGB(255, 255, 221, 74),
                  unselectedItemColor: Color.fromARGB(255, 254, 251, 228),
                  iconSize: 30,
                  items: navBarItems,
                  currentIndex: _selIdx,
                  onTap: _onItemTapped,
                ),
              ),
            ),
          ),
        ));
  }

  void _toLoginPage(BuildContext context) async{
    final sp = await SharedPreferences.getInstance();
    sp.remove('username');

    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  } // _toLoginPage

  void _toProfilePage(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ProfilePage()));
  } // _toProfilePage

  void scrollUp() {
    final double start = controller.position.minScrollExtent;
    controller.animateTo(start,
        duration: const Duration(milliseconds: 700), curve: Curves.easeOut);

    // controller.jumpTo(start),

    /// [controller.animateTo(start,…)] makes the transition between pages and
    /// the same page to show the appearance of the AppBar. If we want to delete
    /// this animation we can simply use [controller.JumpTo(start)]
  }
}
