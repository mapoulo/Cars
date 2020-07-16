import 'package:carousel_slider/carousel_slider.dart';
import 'package:cars/model/car_model.dart';
import 'package:cars/provider/animation_status.dart';
import 'package:cars/provider/my_provider.dart';
import 'package:cars/provider/stream_provider.dart';
import 'package:cars/screens/car_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
    scaleController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    fadeController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: scaleController,
            curve: Curves.easeIn,
            reverseCurve: Curves.easeIn));
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(fadeController);

    super.initState();
  }

  forward() {
    scaleController.forward();
    fadeController.forward();
  }

  reverse() {
    scaleController.reverse();
    fadeController.reverse();
  }

  static List<Cars> cars = carList;

  List<Widget> carImages = _map<Widget>(cars, (index, String image) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    );
  });

  static List<T> _map<T>(List list, Function handler) {
    List<T> result = [];

    for (int i = 0; i < list.length; i++) {
      result.add(handler(i, list[i].carImage));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: ProvidStream().isAnimating,
      stream: state.animatingStatus,
      builder: (context, snapshot) {
        snapshot.data ? forward() : reverse();
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Icon(Icons.favorite_border),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 6),
                  )
                ],
              )
            ],
            leading: Container(
              child: Icon(Icons.menu),
            ),
          ),
          body: ScaleTransition(
            scale: scaleController,
            child: Container(
              // height: 400,
              child: Column(
                children: <Widget>[
                  Consumer<DataProvider>(
                    builder: (context, data, child) {
                      return Container(
                          // height: 100,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: carList[data.getIndex()].carName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text: "\n"),
                              TextSpan(
                                  text: "Founder : ",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: carList[data.getIndex()].founder,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold))
                            ]),
                          ));
                    },
                  ),
                  SizedBox(height: 5),
                  Consumer<DataProvider>(
                    builder: (context, data, child) {
                      return GestureDetector(
                        onTap: () {
                          print(cars[data.getIndex()].carImage);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CarDisplay(
                                    index: data.getIndex(),
                                  )));
                        },
                        child: Hero(
                          tag: "tag" + data.getIndex().toString(),
                          child: CarouselSlider(
                            viewportFraction: 1.0,
                            items: carImages,
                            onPageChanged: (index) {
                              data.setIndex(index);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  Consumer<DataProvider>(
                    builder: (context, data, child) {
                      return Container(
                          padding: EdgeInsets.only(left: 40, right: 0),
                          child: Row(
                            children: _map(cars, (index, image) {
                              return Container(
                                height: 4,
                                width: 40,
                                color: data.getIndex() == index
                                    ? Colors.grey[100]
                                    : Colors.grey[600],
                              );
                            }),
                          ));
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}