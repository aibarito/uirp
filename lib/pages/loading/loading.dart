import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:uirp/pages/email_verification/emailVerification.dart';
import '../../constants.dart';

class LoadingPage extends StatefulWidget {
  final callback;
  final goToPage;
  const LoadingPage({
    Key? key,
    required this.callback,
    required this.goToPage,
  }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  void setupWorldTime(goToPage) async{
    await widget.callback;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return goToPage;
    }));
  }

  @override
  void initState() {
    var goToPage = widget.goToPage;
    super.initState();
    setupWorldTime(goToPage);
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
