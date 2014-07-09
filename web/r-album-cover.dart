import 'package:polymer/polymer.dart';
import 'dart:js';

@CustomTag('r-album-cover')
class RAlbumCover extends PolymerElement {
  @published String albumUrl = '';
  
  RAlbumCover.created() : super.created() {
    context['R'].callMethod('ready', [(ready) {
      context['R']['player'].callMethod('on', ['change:playingTrack', (track) {
        if (track == null)
          return;
        albumUrl = track.callMethod('get', ['icon']);
      }]);
    }]);
  }
}