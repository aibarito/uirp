import 'package:flutter/material.dart';
import 'package:uirp/components/roundedButton.dart';
import 'package:uirp/pages/enable_camera/background.dart';
import 'package:uirp/pages/main_page/mainPage.dart';

import '../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Enable Camera",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  "Your camera will be used to scan the QR code to start or end your ride",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RoundedButton(
                  text: "Enable Camera Access",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MainPage();
                    }));
                  },
                  color: lightColor,
                  textColor: Colors.black,
                ),
              ],
            )));
  }
}
