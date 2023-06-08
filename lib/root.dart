/*import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:app_project/bloc/theme_bloc.dart';

import 'package:app_project/values/values.dart';
import 'package:app_project/widgets/custom_shape_clippers.dart';

class RootScreen extends StatelessWidget {
  RootScreen({@required this.themeBloc});

  final ThemeBloc themeBloc;

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: ClipPath(
              clipper: CustomRootScreenShapeClipper(),
              child: Container(
                height: heightOfScreen,
                decoration: BoxDecoration(color: AppColors.pink),
              ),
            ),
          ),
          Container(
            child: ListView(
              children: [
                designCard(
                  context: context,
                  title: "Login Design 1",
                  imageUrl: ImagePath.LOGIN_1,
                  navigate: () => ExtendedNavigator.root.push(
                    Routes.loginScreen1,
                    arguments: LoginScreen1Arguments(themeBloc: themeBloc),
                  ),
                ),
             

              ],
            ),
          ),
        ],
      ),
    );
  }

  navigate(String routeName, Object arguments) {
    ExtendedNavigator.root.push(routeName, arguments: arguments);
  }

  Widget designCard({
    @required BuildContext context,
    @required String title,
    @required String imageUrl,
    Function() navigate,
  }) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: navigate,
      child: Container(
        height: heightOfScreen * 0.4,
        width: widthOfScreen,
        margin: EdgeInsets.symmetric(
          horizontal: Sizes.MARGIN_20,
          vertical: Sizes.MARGIN_8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_30),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.RADIUS_30),
          ),
          elevation: Sizes.ELEVATION_4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Sizes.RADIUS_30),
                  topLeft: Radius.circular(Sizes.RADIUS_30),
                ),
                child: Image.asset(
                  imageUrl,
                  height: heightOfScreen * 0.3,
                  width: widthOfScreen,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: Sizes.MARGIN_16,
                  horizontal: Sizes.MARGIN_16,
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: AppColors.lightBlueShade5,
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.TEXT_SIZE_18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}*/