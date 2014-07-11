import 'package:polymer/polymer.dart';
import 'dart:js';

@CustomTag('r-model')
class RModel extends PolymerElement {
  @published String albumUrl;
  @published String albumTitle;

  @published List<String> trackNames;
  
  RModel.created() : super.created() {
    context['R'].callMethod('ready', [(ready) {
      context['R']['player'].callMethod('on', ['change:playingSource', (source) {
        if (source.callMethod('get', ['type']) != 'a')
          return;
        JsArray tracks = source.callMethod('get', ['tracks'])['models'];
        trackNames = toObservable(tracks.map((track) => track.callMethod('get', ['name'])).toList());
      }]);
      context['R']['player'].callMethod('on', ['change:playingTrack', (track) {
        if (track == null)
          return;
        albumUrl = track.callMethod('get', ['icon']);
        albumTitle = track.callMethod('get', ['album']);
      }]);
    }]);
  }
}