import 'package:cars/provider/my_provider.dart';
import 'package:cars/screens/profile.dart';
import 'package:cars/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cars/screens/home/the_home_page.dart';
import 'package:provider/provider.dart';

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
    var parentContainer = ChangeNotifierProvider(create: (context) => DataProvider(), child: MainApp()) ;
    var childContainer = ChangeNotifierProvider(create: (context)=>DataProvider(), child: Container(
        color: Colors.white,
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 41, 41, 41),
            body: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              // height: MediaQuery.of(context).size.height,
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
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
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
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Profile(),
                                  ));
                                },
                                child: Text(
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
                          GestureDetector(
                            onTap: (){
                              AuthServices().logOut();
                            },
                            child: Container(
                              child: Text(
                                "Log Out",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ))));

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
