import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/constants.dart';
import 'package:uirp/pages/new_transaction/background.dart';
import 'package:uirp/pages/new_transaction/selectPaymentRow.dart';
import 'package:uirp/providers/selectPayment.dart';
import 'accountBallance.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<SelectPayment>(
        create: (context) => SelectPayment(),
        child: Background(
            child: Column(
                // mainAxisAlignment: ,
                children: <Widget>[
              Text(
                "Transaction",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              AccountBallance(),
              SelectPaymentRow(),
              Container(
                color: lightColor,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                width: size.width,
                height: size.height * 0.07,
                child: TextField(
                    decoration: InputDecoration(
                        labelText: "Enter student Id",
                        border: InputBorder.none)),
              )
            ])));
  }
}
