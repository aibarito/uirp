import 'package:flutter/material.dart';
import 'package:test_side_profile/SlideProfileExperiment/sideProfile2.dart';

import 'body.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              width: size.width * 1,
              child: Stack(
                children: [ // THIS IS THE INTERESTING PART
                  Container(
                    child: sideProfile2
                      (
                      title:"int2k",
                      data:user,
                      //child:this.child,
                    )
                  )
                ],
              ),
              height: size.height * 1,
            )
          ],
        ));
  }
}
