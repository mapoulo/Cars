import 'package:cars/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function togglePage;
  Register({this.togglePage});

  @override
  _RegisterState createState() => _RegisterState(togglePage:togglePage);
}

class _RegisterState extends State<Register> {

  String email;
  String password;
  Function togglePage;

  _RegisterState({this.togglePage});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("SingIn"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(onPressed: (){ widget.togglePage();}, icon: Icon(Icons.arrow_back), label: Text("Register"))
        ],
      ),

      body: Column(
        children: <Widget>[
          
          Container(
            child: TextField(
              onChanged: (value){
                 setState(() {
                   email = value;
                 });
              },
              decoration : InputDecoration(
                hintText: "password"
              ),
            ),
          ),

          Container(
            child: TextField(
              onChanged: (value){
                 setState(() {
                   password = value;
                 });
              },
              
             decoration : InputDecoration(
                hintText: "email"
              ),
            ),
          ),

          Container(
            width: 100,
            height: 50,
            child: FlatButton(
              onPressed: (){
                AuthServices().registerUser(email, password);
              },

              child: Text("Register"),
            )
          )
        ],
      ),
    );
  }
}