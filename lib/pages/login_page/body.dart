import 'package:flutter/material.dart';
import 'package:uirp/components/alreadyHaveAnAccount.dart';
import 'package:uirp/components/roundedButton.dart';
import 'package:uirp/components/roundedEmailField.dart';
import 'package:uirp/components/roundedPasswordField.dart';
import 'package:uirp/constants.dart';
import 'package:uirp/pages/login_page/background.dart';
import 'package:uirp/pages/signup_page/signupPage.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Login Page",
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
              text: "Login",
              press: () {},
              color: primaryColor,
              textColor: Colors.white),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHaveAnAccount(
              login: true,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpPage();
                }));
              }),
        ],
      ),
    );
  }
}
