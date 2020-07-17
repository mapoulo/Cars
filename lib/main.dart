import 'package:cars/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: Authentication().userStream,
       child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
       ),
      );
  }
}