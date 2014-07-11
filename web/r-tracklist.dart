import 'package:polymer/polymer.dart';
import 'dart:js';
import 'dart:html';

@CustomTag('r-tracklist')
class RTracklist extends PolymerElement {
  @published List<JsObject> tracks;
  @published String albumTitle;
  
  RTracklist.created() : super.created();
  
  String getName(JsObject track) {
    return track.callMethod('get', ['name']);
  }
  
  String getIndex(JsObject track) {
    return track.callMethod('get', ['trackNum']);
  }
  
  void playTrack(Event e, var detail, Element target) {
    int trackIndex = int.parse(target.attributes['data-index']);
    int currentIndex = context['R']['player'].callMethod('playingTrack').callMethod('get', ['trackNum']);
    int diff = trackIndex - currentIndex;
    if (diff < 0) {
      for (var i = 0; i < (-diff); ++i) {
        context['R']['player'].callMethod('previous');
      }
    } else if (diff > 0) {
      for (var i = 0; i < diff; ++i) {
        context['R']['player'].callMethod('next');
      }
    }
  }
}