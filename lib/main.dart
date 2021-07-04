import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uirp/pages/bike_lending_page/bikeLendingPage.dart';
import 'package:uirp/pages/home_page/home.dart';
import 'dataBase/leUser.dart';

void main() {
  runApp(MyApp());
}

Map<String, dynamic> userMap = jsonDecode("{\"name\":\"Le Putintin\", \"email\":\"putin@unist.ac.kr\"}");
var demoUser = leUser.fromJson(userMap);

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
      home: BikeLendingPage()//HomePage(),
    );
  }
}
