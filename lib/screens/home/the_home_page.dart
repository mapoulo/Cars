import 'package:cars/provider/my_provider.dart';
import 'package:cars/screens/car_display.dart';
import 'package:cars/screens/home/car_details.dart';
import 'package:cars/screens/home/car_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
                      builder: (context, data, _) {
                        return GestureDetector(
                          onTap: () {
                            print(data.getIndex());
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CarDisplay(
                                      index: data.getIndex(),
                                    )));
                          },
                          child: Text(
                            "View",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}