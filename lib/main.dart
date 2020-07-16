import 'package:carousel_slider/carousel_slider.dart';
import 'package:cars/model/car_model.dart';
import 'package:cars/provider/animation_status.dart';
import 'package:cars/provider/my_provider.dart';
import 'package:cars/provider/stream_provider.dart';
import 'package:cars/screens/car_display.dart';
import 'package:cars/screens/profile.dart';
import 'package:cars/screens/wrapper.dart';
import 'package:cars/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value:AuthServices().user,
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper()
    ),
      );
  }
}






