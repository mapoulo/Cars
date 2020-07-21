import 'package:cars/bloc/blocState.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatefulWidget {
  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[CarImage()],
      ),
    );
  }
}

class CarImage extends StatefulWidget {
  @override
  _CarImageState createState() => _CarImageState();
}

class _CarImageState extends State<CarImage> with TickerProviderStateMixin {
  AnimationController scaleController;
  AnimationController fadeController;

  Animation fadeAnimation;
  Animation scaleAnimation;

  @override
  void initState() {
    fadeController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    scaleController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(fadeController);
    scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: scaleController,
            curve: Curves.easeIn,
            reverseCurve: Curves.easeIn));

    super.initState();
  }

  reverse() {
    fadeController.reverse();
    scaleController.reverse();
  }

  forward() {
    fadeController.forward();
    scaleController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      color: Colors.blueAccent,
      child: Stack(
        children: <Widget>[
          Container(
            height: 50,
            width: 60,
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}

class BottomSheet extends StatefulWidget {
  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  double minSheet = 251.0;
  double topSheet = 100.0;

  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: minSheet, end: topSheet).animate(CurvedAnimation(
        parent: controller, curve: Curves.easeIn, reverseCurve: Curves.easeIn));
    super.initState();
  }

  void forward() {
    controller.forward();
    BlocState().toggleAnimationStatus();
  }

  void reverse() {
    controller.reverse();
    BlocState().toggleAnimationStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
