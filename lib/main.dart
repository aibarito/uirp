import 'package:flutter/material.dart';
import 'package:uirp/pages/home_page/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // scaffoldBackgroundColor: Colors.blue[10],
      ),
      home: HomePage(),
    );
  }
}
