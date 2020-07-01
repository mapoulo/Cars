import 'dart:async';

import 'package:cars/provider/stream_provider.dart';

class AnimationStatus{

  StreamController _controller = StreamController();
  StreamProvider _provider = StreamProvider();

  Stream get animatingStatus => _controller.stream;



}

 final state =  AnimationStatus(); 