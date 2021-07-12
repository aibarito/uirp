import 'package:flutter/material.dart';
import 'package:uirp/components/roundedButton.dart';
import 'package:uirp/pages/enable_camera/enableCameraPage.dart';
import 'package:uirp/pages/google_maps/googleMaps.dart';
import 'package:uirp/pages/home_page/home.dart';
import 'package:uirp/pages/login_page/loginPage.dart';
import 'package:uirp/pages/main_page/background.dart';
import 'package:uirp/pages/my_bicycle/myBicycle.dart';
import 'package:uirp/pages/signup_page/signupPage.dart';
import 'package:uirp/pages/balance/myBalance.dart';
import '../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: SingleChildScrollView(
            child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          "assets/images/Latest_UNIST_logo.png",
          scale: 0.7,
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        RoundedButton(
          text: "Home",
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          },
          color: lightColor,
          textColor: Colors.black,
        ),
        RoundedButton(
          text: "Login",
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
          },
          color: primaryColor,
          textColor: Colors.white,
        ),
        RoundedButton(
          text: "Sign in",
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignUpPage();
            }));
          },
          color: lightColor,
          textColor: Colors.black,
        ),
        RoundedButton(
          text: "Enable Camera Access",
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EnableCameraPage();
            }));
          },
          color: primaryColor,
          textColor: Colors.white,
        ),
        RoundedButton(
          text: "My balance",
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyBalance();
            }));
          },
          color: lightColor,
          textColor: Colors.black,
        ),
        RoundedButton(
          text: "Google Maps",
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return GoogleMaps();
            }));
          },
          color: primaryColor,
          textColor: Colors.white,
        ),
        RoundedButton(
          text: "Bicycle",
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyBicycle();
            }));
          },
          color: lightColor,
          textColor: Colors.black,
        ),
      ],
    )));
  }
}