import 'package:flutter/material.dart';
import 'package:real_estate_app/src/assembly/estate_assembly.dart';

class App extends StatelessWidget {

  final estateAssembly = EstateAssembly();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        body: estateAssembly.module(),
      ),
    );
  }
}