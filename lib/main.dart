import 'package:carousel_slider/carousel_slider.dart';
import 'package:cars/model/car_model.dart';
import 'package:cars/provider/animation_status.dart';
import 'package:cars/provider/my_provider.dart';
import 'package:cars/provider/stream_provider.dart';
import 'package:cars/screens/car_display.dart';
import 'package:cars/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
          create: (context) => DataProvider(), child: CustomDrawer()),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double maxSlide = 130.0;

  void initState() {
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    super.initState();
  }

  void toggleAnimation() {
    if (controller.isDismissed) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    var parentContainer = MainApp();
    var childContainer = Container(
        color: Colors.white,
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 41, 41, 41),
            body: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: 60,
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          SizedBox(width: 10),
                          Container(
                            child: Expanded(
                                child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text: "Nkwe Justice Mapoulo",
                                    ),
                                    TextSpan(
                                      text: "\n",
                                    ),
                                    TextSpan(
                                      text: "Active Status",
                                      style: TextStyle(color: Colors.grey, 
                                      fontSize: 15
                                      ),
                                    ),
                                  ]),
                            )),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.person, color: Colors.white),
                              SizedBox(
                                width: 0,
                              ),
                             FlatButton(
                               onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Profile(),
                                ));
                               },
                               child:  Text(
                                "Profile",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                             )
                            ],
                          )),
                      SizedBox(height: 30),
                      Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.favorite_border, color: Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Favorites",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          )),
                      SizedBox(height: 30),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Icon(Icons.message, color: Colors.white),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Messages",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      )),
                    ],
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Icon(Icons.settings, color: Colors.white),
                          ),
                          SizedBox(width: 5),
                          Container(
                            child: Text(
                              "Settings",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Container(
                              height: 20,
                              width: 3,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              color: Colors.white),
                          SizedBox(width: 5),
                          Container(
                            child: Text(
                              "Log Out",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            )));

    return GestureDetector(
        onTap: () {
          toggleAnimation();
        },
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              double scale = 1 - (controller.value * 0.3);
              double translate = maxSlide * controller.value;
              return Stack(
                children: <Widget>[
                  childContainer,
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(translate)
                      ..scale(scale),
                    child: parentContainer,
                    alignment: Alignment.centerRight,
                  )
                ],
              );
            }));
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CarImages(),
          CarDetails(),
          Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 41, 41, 41),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(25))),
                  child: Center(
                    
                  
                  child: Consumer<DataProvider>(
                    builder: (context, data, _){
                      return GestureDetector(
                        onTap: (){
                          print(data.getIndex());
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CarDisplay(
                              index: data.getIndex(),
                            )
                          ));
                        },
                child: Text(
                  "View",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                      );
                    },
                  ),
                  ),
                ),
              )
              )
        ],
      ),
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
      height: 200,
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
              height: 400,
              child: Column(
                children: <Widget>[
                  Consumer<DataProvider>(
                    builder: (context, data, child) {
                      return Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: carList[data.getIndex()].carName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text: "\n"),
                              TextSpan(
                                  text: "Founder : ",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: carList[data.getIndex()].founder,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))
                            ]),
                          ));
                    },
                  ),
                  SizedBox(height: 10),
                  Consumer<DataProvider>(
                    builder: (context, data, child) {
                      return GestureDetector(
                        onTap: () {
                          print(cars[data.getIndex()].carImage);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CarDisplay(
                                    index: data.getIndex(),
                                  )
                                  ));
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
                  SizedBox(height: 25),
                  Consumer<DataProvider>(
                    builder: (context, data, child) {
                      return Container(
                          padding: EdgeInsets.only(left: 24),
                          child: Row(
                            children: _map(cars, (index, image) {
                              return Container(
                                height: 4,
                                width: 60,
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

class CarDetails extends StatefulWidget {
  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails>
    with SingleTickerProviderStateMixin {
  double topSheet = 100;
  double minSheet = 491;
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
