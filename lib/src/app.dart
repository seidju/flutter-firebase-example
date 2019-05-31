import 'package:flutter/material.dart';
import 'package:real_estate_app/src/ui/estate_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: EstateList(),
      ),
    );
  }
}