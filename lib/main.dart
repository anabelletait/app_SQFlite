import 'package:app/screens/homepage_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomepageScreen(),
    );
  }
}
