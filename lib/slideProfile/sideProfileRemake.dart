/**
 * Version 1.0: All the List views are very similar, will be moved to
 * component style soon.
 * To use this, call sideProfile(
    required-leUser variable,
    optional-Widget child
    )
 *
 * requried-leUser varible example:
 *  Map<String, dynamic> userMap = jsonDecode("{\"name\":\"Le Putintin\", \"email\":\"putin@unist.ac.kr\"}");
    var user = leUser.fromJson(userMap);
 */

import 'package:provider/provider.dart';
import 'package:uirp/slideProfile/leProfile.dart';
import 'package:uirp/pages/balance/myBalance.dart';
import 'package:uirp/pages/bike_stuffs/bike_manager/bikeManagerPage.dart';
import 'package:uirp/pages/main_page/mainPage.dart';

import '../dataBase/leUser.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../dataBase/getLeUserInfo.dart';



class SideProfileRemake extends StatefulWidget {
  //const SideProfileRemake({Key? key}) : super(key: key);
  Widget? customChild;
  String? customText;
  SideProfileRemake ({
    Key? key,
    this.customChild,
    this.customText,
  }) : super(key: key);
  @override
  _SideProfileRemakeState createState() => _SideProfileRemakeState();
}

class _SideProfileRemakeState extends State<SideProfileRemake> {
  Future<LeUser> SSS;

  void initializeLeUser() async{
    SSS = await getLeUserInfo();
}
  @override
  void initState(){
    super.initState();
    SSS = new LeUser();
  }

  void refreshLeUser() {
    setState(() {
      SSS = getLeUserInfo();
    })
  }

  @override
  Widget build(BuildContext context) {

    String str = "";
    if(widget.customText != null)
      str = widget.customText!;
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<LeUser>(
      future: SSS,
      builder: (BuildContext context, AsyncSnapshot<LeUser> leUser) {
        if (leUser.connectionState == ConnectionState.waiting) {
          return new Center(
            child: new CircularProgressIndicator(),
          );
        } else if (leUser.hasError) {
          return new Text('Error: ${leUser.error}');
        } else {
          final items = leUser.data ?? <LeUser>[]; // handle the case that data is null


        }
      },
    );
  }
}

