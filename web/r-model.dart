import 'package:polymer/polymer.dart';
import 'dart:js';

@CustomTag('r-model')
class RModel extends PolymerElement {
  @published String albumUrl;
  @published String albumTitle;

  @published List<JsObject> tracks;
  @published String currentTrack;
  
  RModel.created() : super.created() {
    context['R'].callMethod('ready', [(ready) {
      context['R']['player'].callMethod('on', ['change:playingSource', (source) {
        if (source.callMethod('get', ['type']) != 'a')
          return;
        JsArray jsTracks = source.callMethod('get', ['tracks'])['models'];
        tracks = jsTracks.toList();
      }]);
      context['R']['player'].callMethod('on', ['change:playingTrack', (track) {
        if (track == null)
          return;
        albumUrl = track.callMethod('get', ['icon']);
        albumTitle = track.callMethod('get', ['album']);
        currentTrack = track.callMethod('get', ['name']);
      }]);
    }]);
  }
}