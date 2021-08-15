import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/constants.dart';
import 'package:uirp/providers/balance.dart';

class AccountBallance extends StatelessWidget {
  const AccountBallance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<Balance>(
      builder: (context, balance, child) {
        return Container(
          color: lightColor,
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          width: size.width,
          height: size.height * 0.07,
          child: Row(children: <Widget>[
            Icon(
              Icons.account_balance_wallet_rounded,
              size: 25,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Account Balance",
              style: TextStyle(fontSize: 15),
            ),
            Spacer(),
            Text(balance.balance.toString(), style: TextStyle(fontSize: 20)),
          ]),
        );
      },
    );
  }
}
