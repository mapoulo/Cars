import 'package:cars/screens/home/custom_drawer.dart';
import 'package:cars/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
     
     return StreamProvider.value(
       value: DatabaseService().carStream,
       child: Scaffold(
         body: Stack(
           children: <Widget>[
             CustomDrawer(),
            
           ],
         )
       ),
       );
  }
}