import 'package:polymer/polymer.dart';

@CustomTag('r-app')
class RApp extends PolymerElement {
  @published String albumTitle;
  @published String albumUrl;
  @published List<String> trackNames;
  
  RApp.created() : super.created() {
  }
}