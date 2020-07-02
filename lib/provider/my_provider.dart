import 'package:cars/model/car_model.dart';
import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier{

  int _selectedCarIndex = 0;

  void setIndex(int index){
    _selectedCarIndex = index;
    notifyListeners();
  }


  int getIndex(){
    return _selectedCarIndex;
  }

 

}