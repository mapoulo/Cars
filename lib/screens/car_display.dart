import 'package:cars/model/car_model.dart';
import 'package:flutter/material.dart';

class CarDisplay extends StatefulWidget {
  final Cars obj;
  CarDisplay({this.obj});
  @override
  _CarDisplayState createState() => _CarDisplayState(obj: obj);
}

class _CarDisplayState extends State<CarDisplay> {
  Cars obj;
  _CarDisplayState({this.obj});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Hero(
            tag: "tag",
            child: Stack(
              children: <Widget>[
                Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      image: DecorationImage(
                          image: AssetImage(obj.carImage), fit: BoxFit.cover)),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      margin: EdgeInsets.only(top: 25, left: 7),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      )),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 25, left: 5),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                ),
                
                Positioned(
                  top: 320,
                  left: 15,
                  child: Container(
                    child: Text(
                      obj.founder,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),

                   Positioned(
                  top: 320,
                  left: 300,
                  child: Container(
                    child: Text(
                      "⭐⭐⭐⭐",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Positioned(
                  top: 300,
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )

                
              ],
            ),
          ),
          // Expanded(
          //   child: Stack(
          //     children: <Widget>[
          //       Container(
          //         height: MediaQuery.of(context).size.height,
          //         width: MediaQuery.of(context).size.width,
          //         decoration: BoxDecoration(
          //           color: Color.fromARGB(255, 18, 18, 18),
          //         ),
          //         child: Column(
          //           children: <Widget>[
          //             SizedBox(height: 15),
          //             Center(
          //               child: Container(
          //                 child: Text(
          //                   "Features",
          //                   style: TextStyle(color: Colors.grey, fontSize: 25),
          //                 ),
          //               ),
          //             ),

          //           SizedBox(height: 10),
          //           ListView.builder(
          //             scrollDirection: Axis.horizontal,
          //             itemCount: 8,
          //             itemBuilder: (context, index){
          //               return Container(
          //                 height: 150,
          //                 width: 70,
          //                 color: Colors.white,
          //                 margin: EdgeInsets.all(5),
          //               );
          //             })
          //           ],
          //         ),
          //       ),
          //       Align(
          //           alignment: Alignment.bottomRight,
          //           child: GestureDetector(
          //             onTap: () {},
          //             child: Container(
          //               height: 40,
          //               width: 100,
          //               decoration: BoxDecoration(
          //                   color: Color.fromARGB(255, 41, 41, 41),
          //                   borderRadius: BorderRadius.only(
          //                       topLeft: Radius.circular(25))),
          //               child: Center(
          //                   child: Text(
          //                 "Rent",
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 20,
          //                 ),
          //               )),
          //             ),
          //           ))
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
