import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_project/services/impact.dart';
import 'package:app_project/utils/shared_preferences.dart';

import 'package:app_project/screens/skeleton_page.dart';
import 'package:app_project/screens/login/login_page.dart';
import 'package:app_project/screens/onboarding/impact_ob.dart';

// MUST MODIFY THE UI (ln. 68 to end), THE OTHER LINES ARE OK

class Splash extends StatelessWidget {
  static const route = '/splash/';
  static const routeDisplayName = 'SplashPage';

  const Splash({Key? key}) : super(key: key);

  // Method for navigation SplashPage -> LoginPage
  void _toLoginPage(BuildContext context) {
    debugPrint('DEBUG: $routeDisplayName ln. 21 fnc. _toLoginPage');
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => LoginPage())));
        debugPrint('DEBUG: $routeDisplayName ln. 24 fnc. _toLoginPage');
  } //_toLoginPage

  // Method for navigation SplashPage -> HomePage
  void _toHomePage(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) => SkeletonPage())));
  } //_toHomePage

  // Method for navigation SplashPage -> Impact
  void _toImpactPage(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => ImpactOnboarding())));
  }


  // Token and authentication check function
  void _checkAuth(BuildContext context) async {
    var prefs = Provider.of<Preferences>(context, listen: false);
    String? username = prefs.username;
    String? password = prefs.password;
    debugPrint('DEBUG: $routeDisplayName ln. 44 fnc. _checkAuth');

    // username and password were defined inside the shared preferences

    // no user logged in the app (authentication check)
    if (username == null || password == null) {
      Future.delayed(const Duration(seconds: 1), () => _toLoginPage(context));
      debugPrint('DEBUG: $routeDisplayName ln. 52 fnc. __checkAuth');
    } else {

      // Tokens check
      ImpactService service =
          Provider.of<ImpactService>(context, listen: false);
      bool responseAccessToken = service.checkSavedToken();
      bool refreshAccessToken = service.checkSavedToken(refresh: true);

      // if we have a valid token for impact, proceed
      if (responseAccessToken || refreshAccessToken) {
        Future.delayed(const Duration(seconds: 1), () => _toHomePage(context));
      } else {
        Future.delayed(
            const Duration(seconds: 1), () => _toImpactPage(context));
      }
    }
  }


  // User Interface (TO BE REARRANGED)
  @override
  Widget build(BuildContext context) {
    //Future.delayed(const Duration(seconds: 5), () => _toLoginPage(context));
    Future.delayed(const Duration(seconds: 1), () => _checkAuth(context));
    return Material(
      child: Container(
        color: const Color.fromARGB(255, 1, 97, 4),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Fit2Seed',
              style: TextStyle(
                  color: Color.fromARGB(255, 253, 176, 120),
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            Center(
              child: CircularProgressIndicator(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 253, 176, 120)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
