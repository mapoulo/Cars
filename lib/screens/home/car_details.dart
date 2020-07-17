import 'package:carousel_slider/carousel_slider.dart';
import 'package:cars/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CarCarousel extends StatefulWidget {
  @override
  _CarCarouselState createState() => _CarCarouselState();
}

class _CarCarouselState extends State<CarCarousel> with TickerProviderStateMixin {

  AnimationController scaleController;
  AnimationController fadeController;

  Animation scaleAnimation;
  Animation  fadeAnimation;

  @override
  void initState() {
    scaleController = AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    fadeController = AnimationController(duration: Duration(milliseconds: 400), vsync: this);

    scaleAnimation = Tween<double>(begin: 0.0, end:1.0).animate(CurvedAnimation(parent: scaleController, curve: Curves.easeIn, reverseCurve: Curves.easeIn));

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(fadeController);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
     final List<CarModel> cars = Provider.of<List<CarModel>>(context) ?? [];

     cars.forEach((element) {
       print(element.carName);
     });
   
     List<T> _map<T>(List list, Function handler){
      List<T> results = [];
      for(int i=0; i<list.length; i++){
       results.add(handler(i, list[i].carImage));
      }
      return results;
     }

     List<Widget> carImageList = _map<Widget>(cars, (index, image){
       return Container(
         height: 250,
         width: MediaQuery.of(context).size.width,
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage(image),
             fit: BoxFit.cover
           )
         ),
       );
     });

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),

      body: Column(
        children: <Widget>[
          CarouselSlider(items: carImageList)
        ],
      ),
    );
  }
}