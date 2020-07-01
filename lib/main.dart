import 'package:cars/provider/animation_status.dart';
import 'package:cars/provider/stream_provider.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarImages()
      ],
    );
  }
}

class CarImages extends StatefulWidget {
  @override
  _CarImagesState createState() => _CarImagesState();
}

class _CarImagesState extends State<CarImages> with TickerProviderStateMixin {

  AnimationController scaleController;
  AnimationController fadeController;

  Animation scaleAnimation;
  Animation fadeAnimation;

  @override
  void initState() {

    scaleController = AnimationController(duration: Duration(seconds: 2), vsync: this);
    fadeController = AnimationController(duration: Duration(seconds: 2), vsync: this);

    scaleAnimation = Tween<double>(begin: 0.0, end:1.0).animate(CurvedAnimation(parent: scaleController, curve: Curves.easeIn, reverseCurve: Curves.easeIn));
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(fadeController);

    super.initState();
  }

  forward(){
    scaleController.forward();
    fadeController.forward();
  }

  reverse(){
    scaleController.reverse();
    fadeController.reverse();
  }


  @override
  Widget build(BuildContext context) {
   return StreamBuilder(
     initialData: StreamProvider().isAnimating,
     stream: state.animatingStatus,
     builder: (context, snapshot){
       return Scaffold(
         
       );
     },
   );
  }
}