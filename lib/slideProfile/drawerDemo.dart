import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uirp/slideProfile/sideProfile.dart';

import '../dataBase/leUser.dart';

class drawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userMap = jsonDecode("{\"name\":\"Le Putintin\", \"email\":\"putin@unist.ac.kr\"}");
    var user = LeUser.fromJson(userMap);
    return Scaffold(
      body: Stack (
        children: [
          Container(
            child: sideProfile(
              data:user,
              child: Center(
                  child: Text(
                    "this is demopage for the drawer",
                    style: TextStyle(fontSize: 50),
                  )
              )
            ),
          ),

        ],
      )
    );
  }
}