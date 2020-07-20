import 'dart:async';

import 'package:cars/bloc/bloc_provider.dart';

class BlocState{

  BlocProvider provider = BlocProvider();
 StreamController controller = StreamController();

  Stream get animationStatus{
    return controller.stream;
  }

  void toggleAnimationStatus(){
    provider.toggleAnimatingValaue();
    controller.sink.add(provider.isAnimating);
  }

  void dispose(){
    controller.close();
  }

}

final state = BlocState();