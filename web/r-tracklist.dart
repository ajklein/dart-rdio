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
  
  String getKey(JsObject track) {
    return track.callMethod('get', ['key']);
  }
  
  void playTrack(Event e, var detail, Element target) {
    String trackId = target.attributes['data-key'];
    // FIXME: Make this play nice with the rest of the UI; currently, we
    // drop the rest of the album on the floor.
    context['R']['player'].callMethod('play', [new JsObject.jsify({'source': trackId})]);
  }
}