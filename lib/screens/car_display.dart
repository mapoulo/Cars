import 'package:cars/model/car_model.dart';
import 'package:cars/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarDisplay extends StatefulWidget {
  @override
  _CarDisplayState createState() => _CarDisplayState();
}

class _CarDisplayState extends State<CarDisplay> {
  
  List<Cars> cars = carList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: "tag",
            child: Consumer<DataProvider>(builder: (context, data, child) {
              return Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(cars[data.getIndex()].carImage),
                        fit: BoxFit.cover)),
              );
            }),
          )
        ],
      ),
    );
  }
}
