import 'package:polymer/polymer.dart';

@CustomTag('r-tracklist')
class RTracklist extends PolymerElement {
  @published List<String> tracks;
  
  RTracklist.created() : super.created();
}