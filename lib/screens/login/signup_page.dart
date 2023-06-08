import 'package:app_project/widgets/custom_shape_clippers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:app_project/bloc/theme_bloc.dart';
import 'package:app_project/routes/router.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';


import 'package:app_project/widgets/custom_button.dart';

import 'package:app_project/widgets/custom_text_form_field.dart';


class StringConst {
  static const String REGISTER = "Register";
  static const String SIGN_UP = "Sign Up";
  static const String SIGN_UP_MSG = "We are happy to see you here!";
  static const String NAME = "Name";
  static const String EMAIL_ADDRESS = "Email Address";
  static const String PASSWORD= "Password";
  static const String ALREADY_HAVE_AN_ACCOUNT = "Already have an account? ";
  
}

class SignUp extends StatefulWidget {
  SignUp();

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: heightOfScreen,
              width: widthOfScreen,
              decoration: const BoxDecoration(color: Color.fromARGB(255, 253, 176, 120)),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: CustomSignUpShapeClipper2(),
                child: Container(
                  height: heightOfScreen,
                  decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 114, 106)),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: CustomSignUpShapeClipper1(),
                child: Container(
                  height: heightOfScreen,
                  decoration: const BoxDecoration(color: Color.fromARGB(255, 254, 251, 228)),
                ),
              ),
            ),
            Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: heightOfScreen * 0.2),
                        _buildIntroText(context),
                        const SizedBox(height: 20),
                        _buildForm(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildIntroText(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return const ListBody(
      children: <Widget>[
        Text(
          StringConst.SIGN_UP,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 254, 251, 228)
          ),
        ),
        SizedBox(height: 8),
        Text(
          StringConst.SIGN_UP_MSG,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 254, 251, 228)
        ),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      children: <Widget>[
        CustomTextFormField(
          hasPrefixIcon: true,
          textInputType: TextInputType.text,
          hintText: StringConst.NAME,
          hintTextStyle: const TextStyle (
            color: Color.fromARGB(255, 254, 251, 228),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            //fontStyle: FontStyle.normal,
            ),
          textStyle: const TextStyle (
            color: Color.fromARGB(255, 254, 251, 228),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            //fontStyle: FontStyle.normal,
            ),
          prefixIcon: const Icon(
            FeatherIcons.user,
            color: Color.fromARGB(255, 254, 251, 228),
            size: 20.0,
          ),
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          hasPrefixIcon: true,
          textInputType: TextInputType.emailAddress,
          hintText: StringConst.EMAIL_ADDRESS,
          hintTextStyle: const TextStyle (
            color: Color.fromARGB(255, 254, 251, 228),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            //fontStyle: FontStyle.normal,
            ),
          textStyle: const TextStyle (
            color: Color.fromARGB(255, 254, 251, 228),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            //fontStyle: FontStyle.normal,
            ),
          prefixIcon: const Icon(
            FeatherIcons.mail,
            color: Color.fromARGB(255, 254, 251, 228),
            size: 20.0,
          ),
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          hasPrefixIcon: true,
          textInputType: TextInputType.text,
          hintText: StringConst.PASSWORD,
          hintTextStyle: const TextStyle (
            color: Color.fromARGB(255, 254, 251, 228),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            //fontStyle: FontStyle.normal,
            ),
          textStyle: const TextStyle (
            color: Color.fromARGB(255, 254, 251, 228),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            //fontStyle: FontStyle.normal,
            ),
          obscured: true,
          prefixIcon: const Icon(
            FeatherIcons.key,
            color: Color.fromARGB(255, 254, 251, 228),
            size: 20.0,
          ),
        ),
        const SizedBox(height: 24),
        CustomButton(
          title: StringConst.SIGN_UP,
          textStyle: const TextStyle (
            color: Color.fromARGB(255, 255, 114, 106),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontStyle: FontStyle.normal,),
          onPressed: () {},
        ),
        const SizedBox(height: 20),
        const InkWell(
          //onTap: () => ExtendedNavigator.root.popAndPush(Routes.loginScreen1),
          child: Text(
            StringConst.ALREADY_HAVE_AN_ACCOUNT,
            textAlign: TextAlign.center,
            style: TextStyle (
            color: Color.fromARGB(255, 254, 251, 228),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontStyle: FontStyle.normal,),
            ),
        ),
       
      ],
    );
  }
}
