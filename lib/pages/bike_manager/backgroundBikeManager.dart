import 'package:flutter/material.dart';
import 'package:uirp/components/mainArrow.dart';
import 'package:uirp/slideProfile/sideProfile.dart';

import '../../main.dart';

class BackGroundBikeManager extends StatelessWidget {
  final Widget child;
  const BackGroundBikeManager({
    required this.child,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: sideProfile(
        data: demoUser,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(26, 26, 18, 1),
          ),
          body: Container(
            height: size.height,
            width: double.infinity,
            child: Stack(
              //alignment: Alignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Color.fromRGBO(26, 26, 18, 1)),
                ),
                SingleChildScrollView(
                  child: child,
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}
