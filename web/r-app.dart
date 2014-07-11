import 'package:polymer/polymer.dart';
import 'dart:js';

@CustomTag('r-app')
class RApp extends PolymerElement {
  @published String albumTitle;
  @published String albumUrl;
  @published List<JsObject> tracks;
  @published String currentTrack;
  
  RApp.created() : super.created();
  
  void openTracklist() {
    // FIXME: Dart's drawer-panel doesn't support toggleDrawer() method
    $['drawer-panel'].selected = 'drawer';
  }
}