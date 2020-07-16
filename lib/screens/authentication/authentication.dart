import 'package:cars/screens/authentication/register.dart';
import 'package:cars/screens/authentication/sign_in.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  bool showSigInPage = true;

  void togglePages(){
    setState(() {
      showSigInPage = !showSigInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
   if(showSigInPage){
     return SignIn(togglePages: togglePages);
   }else{
     return Register(togglePage: togglePages);
   }
  }
}