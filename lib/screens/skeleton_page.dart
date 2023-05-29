import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


import 'package:app_project/screens/login_page.dart';
import 'package:app_project/screens/home_page.dart';
import 'package:app_project/screens/projects_page.dart';
import 'package:app_project/screens/training_page.dart';
import 'package:app_project/screens/partner_page.dart';
import 'package:app_project/screens/profile_page.dart';

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

List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.run),
      label: 'Activity',
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.tractor),
      label: 'Firm',
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.homeOutline),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.humanQueue),
      label: 'Partner',
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.shoppingOutline),
      label: 'Promo',
    ),
  ];


/*List<Widget> navBarItems = [
    const Icon(MdiIcons.run,size: 30,color: Color.fromARGB(255, 1, 97, 4),),
    const Icon(MdiIcons.mapMarkerOutline,size:30,color: Color.fromARGB(255, 1, 97, 4),),
    const Icon(MdiIcons.homeOutline,size: 30,color: Color.fromARGB(255, 1, 97, 4),),
    const Icon(MdiIcons.humanQueue,size:30,color: Color.fromARGB(255, 1, 97, 4),),
    const Icon(MdiIcons.shoppingOutline,size: 30,color: Color.fromARGB(255, 1, 97, 4),),
  ];*/

void _onItemTapped(int currentIndex){
    setState(() {
      _selIdx = currentIndex;
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
                  onTap: () => _toProfilePage(context),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            //shadowColor: Colors.transparent,
            backgroundColor: const Color.fromARGB(255, 254, 251, 228) ,
            elevation: 0,
            centerTitle: true,
            title: Container(
              width: 150.0,
              height: 50.0,
              child: 
                Image.asset("assets/images/nome.png", fit:BoxFit.contain, ),),
            actions: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: IconButton(
                  onPressed: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => Profile()));
                  */},
                  icon: const Icon(
                    MdiIcons.account,
                    size: 35,
                    color: Color.fromARGB(255, 1, 97, 4),
                  )),
            )
          ],
        ),
          body: _selectPage(index: _selIdx),
          
          bottomNavigationBar: BottomNavigationBar(
            //backgroundColor: const Color.fromARGB(255, 6, 8, 5),
            //elevation:0,
            selectedIconTheme: const IconThemeData(
              color: Color.fromARGB(255,1,97,4),),
              fixedColor:  const Color.fromARGB(255, 1, 97, 4),
              unselectedIconTheme: const IconThemeData(
              color: Color.fromARGB(100,1, 97, 4),),
              items: navBarItems,
              iconSize: 30,
              currentIndex: _selIdx,
              onTap: _onItemTapped,
              ),

        /*bottomNavigationBar: CurvedNavigationBar(
            key: navigationKey,
            backgroundColor: Colors.transparent,
            color: const Color.fromARGB(255, 254, 251, 228),
            buttonBackgroundColor: const Color.fromARGB(255, 1, 97, 4),
            height: 60,
            animationCurve: Curves.easeIn,
            animationDuration: const Duration(milliseconds: 400),
            items: navBarItems,
            index: _selIdx,
            onTap: _onItemTapped,
          ),*/
        ),
      ),
    );
  }

  void _toLoginPage(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginPage()));
  } // _toLoginPage

  void _toProfilePage(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ProfilePage()));
  } // _toProfilePage

}
