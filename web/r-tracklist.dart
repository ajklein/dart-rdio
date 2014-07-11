import 'package:polymer/polymer.dart';
import 'dart:js';

@CustomTag('r-tracklist')
class RTracklist extends PolymerElement {
  @published List<JsObject> tracks;
  @published String albumTitle;
  
  RTracklist.created() : super.created();
  
  String getName(JsObject track) {
    return track.callMethod('get', ['name']);
  }
}