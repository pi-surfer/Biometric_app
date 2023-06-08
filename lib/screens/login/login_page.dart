import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_login/flutter_login.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:app_project/bloc/theme_bloc.dart';
//import 'package:app_project/routes/router.dart';

import 'package:app_project/screens/login/signup_page.dart';
import 'package:app_project/screens/home_page.dart';
import 'package:app_project/widgets/custom_shape_clippers.dart';
import 'package:app_project/widgets/custom_text_form_field.dart';
import 'package:app_project/widgets/custom_button.dart';



 class StringConst{
      static const String SIGN_IN_MSG = "Hey! Good to see you again.";
      static const String WELCOME = "Welcome Back!";
      static const String EMAIL_ADDRESS = "Email Address";
      static const String SIGN_IN = "Sign In";
      static const String DONT_HAVE_AN_ACCOUNT = "Don't have an account?";


    }

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key:key);

  static const routename = 'LoginPage';

  @override
  State <Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    //_checkLogin();
    //widget.themeBloc.selectedTheme.add(_buildLightTheme());
  }

  /*void _checkLogin() async {
    final sp = await SharedPreferences.getInstance();
    if(sp.getString('username') != null){
      //If 'username is set, push the HomePage
      _toHomePage(context);
  }
  }*/


Future<String> _loginUser(LoginData data) async {
    if(data.name == 'bug@expert.com' && data.password == '5TrNgP5Wd'){

      final sp = await SharedPreferences.getInstance();
      sp.setString('username', data.name);

      return '';
    } else {
      return 'Wrong credentials';
    }
  } 

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var textTheme = Theme.of(context).textTheme;

   

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 251, 228),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: CustomLoginShapeClipper2(),
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
                clipper: CustomLoginShapeClipper1(),
                child: Container(
                  height: heightOfScreen,
                  decoration: const BoxDecoration(color: Color.fromARGB(255, 253, 176, 120)),
                ),
              ),
            ),
         Container(
            margin: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(height: 120),
                  _buildIntroText(context),
                  const SizedBox(height: 8),
                  _buildForm(context),
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
    var heightOfScreen = MediaQuery.of(context).size.height;
    
    

    return const ListBody(
      children: <Widget>[
        Text(
          StringConst.WELCOME,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 254, 251, 228)
        ),),
        SizedBox(height:15),
        Text(
          StringConst.SIGN_IN_MSG,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 254, 251, 228)
        ),),
        SizedBox(height: 55),
        Text(
          StringConst.SIGN_IN,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 254, 251, 228)
          ),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var iconTheme = Theme.of(context).iconTheme;
    const String PASSWORD = "Password";
    
    const String SIGN_IN = "Sign In";
    
   
    return Column(
      children: <Widget>[
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
        const SizedBox(height:20),
        CustomTextFormField(
          hasPrefixIcon: true,
          textInputType: TextInputType.text,
          hintTextStyle: const TextStyle (
            color: Color.fromARGB(255, 254, 251, 228),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontStyle: FontStyle.normal,),
          textStyle: const TextStyle (
            color: Color.fromARGB(255, 254, 251, 228),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontStyle: FontStyle.normal,),
          hintText: PASSWORD,
          obscured: true,
          prefixIcon: const Icon(
            FeatherIcons.key,
            color: Color.fromARGB(255, 254, 251, 228),
            size: 20.0,
          ),
        ),
        const SizedBox(height:20),
        CustomButton(
          title: SIGN_IN,
          textStyle: const TextStyle (
            color: Color.fromARGB(255, 255, 114, 106),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontStyle: FontStyle.normal,),
          onPressed: () {},
        ),
        const SizedBox(height:20),
        const InkWell(
          //onTap: () => ExtendedNavigator.root.push(Routes.signUpScreen1),
          child: Text(
            StringConst.DONT_HAVE_AN_ACCOUNT,
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



//void _toHomePage(BuildContext context){
//    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
//  }


}
