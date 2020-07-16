import 'package:flutter/material.dart';
import 'package:cars/services/auth.dart';


class SignIn extends StatefulWidget {
  
  final Function togglePages;
  SignIn({this.togglePages});

  @override
  _SignInState createState() => _SignInState(togglePage: togglePages);
}

class _SignInState extends State<SignIn> {

  Function togglePage;
  String email;
  String password;

 _SignInState({this.togglePage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("SingIn"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            widget.togglePages();
          }, icon: Icon(Icons.arrow_back), label: Text("Register"))
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
                AuthServices().signIn(email, password);
              },

              child: Text("Login"),
            )
          )
        ],
      ),
    );
  }
}