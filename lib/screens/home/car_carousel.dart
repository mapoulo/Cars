import 'package:cars/bloc/blocState.dart';
import 'package:cars/bloc/bloc_provider.dart';
import 'package:cars/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarCarousel extends StatefulWidget {
  @override
  _CarCarouselState createState() => _CarCarouselState();
}

class _CarCarouselState extends State<CarCarousel>
    with TickerProviderStateMixin {
  AnimationController fadeController;
  AnimationController scaleController;

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

  forward() {
    fadeController.forward();
    scaleController.forward();
  }

  reverse() {
    fadeController.reverse();
    scaleController.reverse();
  }

  List<String> carList = ["Bugatti", "Mazda", "BMW"];

  @override
  Widget build(BuildContext context) {
    final cars = Provider.of<List<CarModel>>(context) ?? [];
    cars.forEach((element) {
      print(element.carName);
    });

    return Scaffold(
        body: StreamBuilder(
            initialData: BlocProvider().isAnimating,
            builder: (context, snapshot) {
              snapshot.data ? forward() : reverse();
              return ScaleTransition(
                scale: scaleController,
                child: Column(
                  
                  children: <Widget>[
                    SafeArea(
                      child: Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.menu, color: Colors.grey),
                            ),   

                        Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey
                                ),
                              )
                            ),  
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Hi, ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 95, 98, 95),
                                    fontSize: 25)),
                            TextSpan(
                                text: "Nkwe",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 95, 98, 95),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25))
                          ]),
                        )),
                    SizedBox(height: 25),
                    Center(
                      child: Container(
                        height: 30,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 80,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 15,
                              width: 50,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                            );
                          }),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "Cars",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: carList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 6,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey),
                              child: Center(child: Text(carList[index])),
                            );
                          }),
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cars.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 250,
                              width: 200,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 95, 98, 95),
                              ),
                              child: Image.network(cars[index].carImage,
                                  fit: BoxFit.fitWidth),
                            );
                          }),
                    )
                  ],
                ),
              );
            }));
  }
}
