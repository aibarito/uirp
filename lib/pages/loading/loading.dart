import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:uirp/pages/login_page/body.dart';
import '../../constants.dart';
import 'package:uirp/pages/login_page/loginPage.dart';
class LoadingPage extends StatefulWidget {
  final callback;
  const LoadingPage({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}
class _LoadingState extends State<LoadingPage> {

  void setupWorldTime() async{
      await widget.callback;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginPage();
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
      )
    );
  }


}
