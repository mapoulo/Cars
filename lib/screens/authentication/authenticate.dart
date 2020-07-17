import 'package:cars/screens/authentication/login.dart';
import 'package:cars/screens/authentication/registration.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

   bool showLoginPage = true;
   void togglePages(){
     setState(() {
       showLoginPage = !showLoginPage;
     });
   }
  @override
  Widget build(BuildContext context) {  
    if(showLoginPage){
      return Login(togglePage: togglePages);
    }else{
      return Register(togglePage:togglePages);
    }
  }
}