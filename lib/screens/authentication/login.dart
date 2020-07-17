import 'package:cars/screens/authentication/authenticate.dart';
import 'package:cars/services/auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  Function togglePage;
  Login({this.togglePage});

  @override
  _LoginState createState() => _LoginState(togglePage: togglePage);
}

class _LoginState extends State<Login> {
  String email;
  String password;
  Function togglePage;

  _LoginState({this.togglePage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        centerTitle: true,
        actions: <Widget>[
          RaisedButton(onPressed: (){
            widget.togglePage();
          },
            child: Text("Toggle"),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 150),
          Container(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },

               decoration: InputDecoration(
                hintText: "Email"
              ),
            ),
          ),
          Container(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Password"
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: () async {
                Authentication().login(email, password);
              },
              child: Text("Login"),
            ),
          )
        ],
      ),
    );
  }
}
