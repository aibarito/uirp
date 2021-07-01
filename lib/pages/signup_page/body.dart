import 'package:flutter/material.dart';
import 'package:uirp/components/alreadyHaveAnAccount.dart';
import 'package:uirp/components/roundedButton.dart';
import 'package:uirp/components/roundedEmailField.dart';
import 'package:uirp/components/roundedPasswordField.dart';
import 'package:uirp/pages/login_page/loginPage.dart';
import 'package:uirp/pages/signup_page/background.dart';

import '../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Sign up",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Image.asset(
          "assets/images/Latest_UNIST_logo.png",
          scale: 0.7,
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        RoundedEmailField(
          hint: "Username",
          icon: Icon(Icons.person, color: primaryColor),
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          onChanged: (value) {},
        ),
        RoundedButton(
            text: "Sign up",
            press: () {},
            color: primaryColor,
            textColor: Colors.white),
        SizedBox(
          height: size.height * 0.03,
        ),
        AlreadyHaveAnAccount(
            login: false,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginPage();
              }));
            }),
      ],
    ));
  }
}
