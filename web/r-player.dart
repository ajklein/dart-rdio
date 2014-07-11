import 'package:polymer/polymer.dart';
import 'dart:js';

@CustomTag('r-player')
class RPlayer extends PolymerElement {
  @observable bool playing = false; 
  
  RPlayer.created() : super.created() {
    context['R'].callMethod('ready', [(ready) {
      context['R']['player'].callMethod('play', [new JsObject.jsify({'source': 'a171827'})]);
      playing = true;
    }]);
  }

  void togglePause() {
    context['R']['player'].callMethod('togglePause');
    playing = !playing;
  }
  
  void next() {
    context['R']['player'].callMethod('next');    
  }
  
  void previous() {
    context['R']['player'].callMethod('previous');
  }
}

