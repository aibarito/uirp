import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_side_profile/SlideProfileExperiment/background.dart';
import 'package:test_side_profile/SlideProfileExperiment/sideProfile2.dart';
import 'sideProfile.dart';


import '../leUser.dart';

Map<String, dynamic> userMap = jsonDecode("{\"name\":\"Le Putintin\", \"email\":\"putin@unist.ac.kr\"}");
var user = leUser.fromJson(userMap);


class Body extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(child: Text("WHAT"),
    );
  }
}