import 'package:flutter/material.dart';

import 'package:app_project/screens/login_page.dart';


class RewardPage extends StatelessWidget {
  const RewardPage({Key? key}) : super(key: key);

  static const routename = 'RewardPage';

  @override
  Widget build(BuildContext context) {
    print('${RewardPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(RewardPage.routename),
      ),
      body: Center(
        child: Text('login_flow'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text('login_flow'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('logout'),
              onTap: () => _toLoginPage(context),
            )
          ],
        ),
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
