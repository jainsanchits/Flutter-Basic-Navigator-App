import 'package:flutter/material.dart';
import 'ConnectionStatusSingleton.dart';
import 'PageOne.dart';
import 'PageThree.dart';
import 'PageTwo.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();

  runApp(new MaterialApp(
    home: new PageOne(),
    routes: <String, WidgetBuilder>{
      '/pageOne': (BuildContext context) => new PageOne(),
      '/pageTwo': (BuildContext context) => new PageTwo(),
      '/pageThree': (BuildContext context) => new PageThree()
    },
  ));
}