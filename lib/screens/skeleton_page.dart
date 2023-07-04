import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:bottom_nav_layout/bottom_nav_layout.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
//import 'package:motion_tab_bar_v2/motion-badge.widget.dart';

import 'package:app_project/screens/login_page.dart';
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
// To use it:
// onPressed: () {final _navigationSate = navigationKey.currentState!;
// _navigationState.setPage(0);
// }
// ref: https://www.youtube.com/watch?v=TX2x41h47fE

  TabController? _tabController;
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
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
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 39, 145, 43),
                      ),
                      child: Text('My Profile'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('logout'),
                      onTap: () => _toLoginPage(context),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Profile'),
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
                            onPressed: () => Scaffold.of(context).openDrawer(),
                            icon: const Icon(MdiIcons.account,
                                color: Color.fromARGB(255, 1, 97, 4),
                                size: 30));
                      }),
                      backgroundColor: const Color.fromARGB(255, 254, 251, 228),
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
                body: TabBarView(
                  physics:
                      NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
                  controller: _tabController,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    const HomePage(),
                    Activity(),
                    const ProjectPage(),
                    const Partner(),
                    const RewardPage(),
                  ],
                ),
              ),
              bottomNavigationBar: MotionTabBar(
                initialSelectedTab: "Home",
                useSafeArea: true, // default: true, apply safe area wrapper
                labels: const ["Home", "Activity", "Projects", "Partners", "Rewards"],
                icons: const [
                  Icons.home,
                  Icons.sports_basketball,
                  Icons.location_pin,
                  Icons.people_alt,
                  Icons.qr_code,
                ],
                tabSize: 50,
                tabBarHeight: 55,
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 254, 251, 228),
                  fontWeight: FontWeight.bold,
                ),
                tabIconColor: Color.fromARGB(255, 254, 251, 228),
                tabIconSize: 28.0,
                tabIconSelectedSize: 26.0,
                tabSelectedColor: Color.fromARGB(255, 254, 251, 228),
                tabIconSelectedColor: Color.fromARGB(255,  50, 165, 19),
                tabBarColor: const Color.fromARGB(255, 50, 165, 19),
                onTabItemSelected: (int value) {
                  scrollUp();
                  setState(() {
                    _tabController!.index = value;
                  });
                },
              ),
            ),
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
