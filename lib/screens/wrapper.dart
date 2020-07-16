import 'package:cars/model/user.dart';
import 'package:cars/provider/my_provider.dart';
import 'package:cars/screens/authentication/authentication.dart';
import 'package:cars/screens/home/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if(user == null){
      return Authentication();
    }else{
      return CustomDrawer();
    }
  }
}

      // return ChangeNotifierProvider(create: (context) => DataProvider(), child: CustomDrawer());

