import 'package:polymer/polymer.dart';
import 'dart:js';

@CustomTag('r-player')
class RPlayer extends PolymerElement {
  RPlayer.created() : super.created() {
  }

  void play() {
    context['R']['player'].callMethod('play', [new JsObject.jsify({'source': 'a171827'})]);
  }
  
  void pause() {
    context['R']['player'].callMethod('togglePause');
  }
  
  void next() {
    context['R']['player'].callMethod('next');    
  }
  
  void previous() {
    context['R']['player'].callMethod('previous');
  }
}

