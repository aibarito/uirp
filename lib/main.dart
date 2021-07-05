import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uirp/pages/main_page/mainPage.dart';
import 'package:uirp/providers/balance.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Balance>(
        create: (context) => Balance(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // scaffoldBackgroundColor: Colors.blue[10],
          ),
          home: MainPage(),
        ));
  }
}
