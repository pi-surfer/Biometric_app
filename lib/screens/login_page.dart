import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'package:app_project/screens/home_page.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routename = 'LoginPage';

  // qui si inserisce la funzione che controlla che il nome utente e la password siano giusti
   Future <String> _loginUser(LoginData data) async {
    if(data.name == 'bug@expert.com' && data.password == '5TrNgP5Wd') {
      return '';
    } else {
      return ('wrong credentials');
    }
   } // _loginUser

   Future <String> _signUpUser(SignupData data) async{
    return 'to be implemented';
   } // _signUpUser

   Future <String> _recoverPassword(String email) async{
    return 'recover password functionality needs to be implemented';
   } // _recoverPassword

  @override
  Widget build(BuildContext context) {
    
    return FlutterLogin(
      title: 'login_flow',
      onLogin: _loginUser,
      onSignup: _signUpUser,
      onRecoverPassword: _recoverPassword, // devo mettere queste funzioni perché sono onSignup e onRecoverPassword sono richiesti da FlutterLogin
      onSubmitAnimationCompleted: () async{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
      },
    );
  } // build
} // LoginScreen