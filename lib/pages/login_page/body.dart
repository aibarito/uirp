import 'package:flutter/material.dart';
import 'package:uirp/components/alreadyHaveAnAccount.dart';
import 'package:uirp/components/roundedButton.dart';
import 'package:uirp/components/roundedEmailField.dart';
import 'package:uirp/components/roundedPasswordField.dart';
import 'package:uirp/constants.dart';
import 'package:uirp/pages/login_page/background.dart';
import 'package:uirp/pages/signup_page/signupPage.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _Body();
}


class _Body extends State<Body>{
  bool _validate = false;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _username_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      /*final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );*/
    });
    _username_controller.addListener(() {

    });
    _password_controller.addListener(() {

    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _username_controller.dispose();
    _password_controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            validate: _validate,
            controller: _username_controller,
            hint: "Username",
            icon: Icon(Icons.person, color: primaryColor),
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            controller: _password_controller,
            onChanged: (value) {},
          ),
          RoundedButton(
              text: "Login",
              callback: () {},
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
    )
    );
  }
}
