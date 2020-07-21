import 'package:cars/screens/home/car_carousel.dart';
import 'package:flutter/material.dart';


class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> with SingleTickerProviderStateMixin {

  AnimationController controller;
  double maxSlide = 155.0;

  var parentContainer = CarCarousel();
  var childContainer = Container(color: Colors.yellow);

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }

  void toggleAnimation(){
      if(controller.isDismissed){
          controller.forward();
      }else{
          controller.reverse();
      }
  }

  @override
  Widget build(BuildContext context) {
    
     return GestureDetector(
       onTap: (){
         toggleAnimation();
       },

       child: AnimatedBuilder(
         animation: controller, 
         builder: (context, _){

           double translate = maxSlide * controller.value;
           double scale = 1 - controller.value * 0.3;

           return Stack(
             children: <Widget>[
               childContainer,
               Transform(
                 transform: Matrix4.identity()..translate(translate)..scale(scale),
                 child: parentContainer,
                 alignment: Alignment.bottomRight,
               )
             ],
           );
         }),
     );
  }
}