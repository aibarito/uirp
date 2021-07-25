import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:uirp/pages/email_verification/emailVerification.dart';
import '../../constants.dart';

class LoadingPage extends StatefulWidget {
  final String email;
  final callback;
  const LoadingPage({
    Key? key,
    required this.callback,
    required this.email,
  }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  void setupWorldTime() async {
    await widget.callback;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EmailVerification(email: widget.email);
    }));
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: SpinKitRotatingCircle(
            color: lightColor,
            size: 50.0,
          ),
        ));
  }
}
