import 'package:polymer/polymer.dart';
import 'dart:js';

@CustomTag('r-player')
class RPlayer extends PolymerElement {
//  @published int count = 0;
  
  RPlayer.created() : super.created() {
  }

  void play() {
    var player = context['R']['player'];
    player.callMethod('play', [new JsObject.jsify({'source': 'a171827'})]);
  }
  
  void pause() {
    var player = context['R']['player'];
    player.callMethod('togglePause');
  }
}

