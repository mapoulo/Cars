import 'package:cars/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Function togglePage;
  Register({this.togglePage});

  @override
  _RegisterState createState() => _RegisterState(togglePage: togglePage);
}

class _RegisterState extends State<Register> {
  @override
  String email;
  String password;
  Function togglePage;
  _RegisterState({this.togglePage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        centerTitle: true,
        actions: <Widget>[
          RaisedButton(
            onPressed: () {
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
                Authentication().register(email, password);
              },
              child: Text("Register"),
            ),
          )
        ],
      ),
    );
  }
}
