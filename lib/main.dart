import 'package:flutter/material.dart';

import 'CreateProductPage.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'crud',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: CreateProductPage(),
    );
  }

}




