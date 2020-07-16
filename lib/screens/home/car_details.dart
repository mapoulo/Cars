import 'package:cars/model/car_model.dart';
import 'package:cars/provider/animation_status.dart';
import 'package:cars/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarDetails extends StatefulWidget {
  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails>
    with SingleTickerProviderStateMixin {
  double topSheet = 100;
  double minSheet = 351;
  AnimationController scaleController;
  Animation animation;

  @override
  void initState() {
    scaleController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: minSheet, end: topSheet).animate(
        CurvedAnimation(
            parent: scaleController,
            curve: Curves.easeIn,
            reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  forward() {
    scaleController.forward();
    state.toggleAnimationStatus();
  }

  reverse() {
    scaleController.reverse();
    state.toggleAnimationStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: animation.value,
        child: GestureDetector(
          onTap: () {
            scaleController.isCompleted ? reverse() : forward();
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 18, 18, 18),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35))),
            child: Column(
              children: <Widget>[
                SizedBox(height: 15),
                Container(
                  height: 4,
                  width: 100,
                  color: Color.fromARGB(255, 41, 41, 41),
                ),
                Consumer<DataProvider>(builder: (context, data, child) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(40),
                        child: Text(
                          carList[data.getIndex()].description,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ));
  }
}
