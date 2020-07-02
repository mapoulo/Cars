import 'dart:async';

import 'package:cars/provider/stream_provider.dart';

class AnimationStatus{

  StreamController _controller = StreamController();
  ProvidStream _provider = ProvidStream();

  Stream get animatingStatus => _controller.stream;
   
   void toggleAnimationStatus(){
     _provider.toggleAinimatingValue();
     _controller.sink.add(_provider.isAnimating);
   }

   void dispos(){
     _controller.close();
   }

}

 final state =  AnimationStatus(); 