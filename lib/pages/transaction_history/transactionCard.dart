import 'package:flutter/material.dart';

import '../../constants.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    Key? key,
    required this.paymentType,
    required this.account,
    required this.amount,
  }) : super(key: key);

  final String paymentType;
  final account;
  final amount;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 0.12,
        color: lightColor,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Icon(
                Icons.person_rounded,
                size: 40,
              ),
              height: size.height * 0.12,
              width: size.width * 0.2,
            ),
            Positioned(
                left: 80,
                top: 23,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      paymentType,
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Icon(Icons.arrow_forward),
                      SizedBox(
                        width: 10,
                      ),
                      Text(account, style: TextStyle(fontSize: 20))
                    ]),
                  ],
                )),
            Positioned(
              child: Text(
                amount + " W",
                style: TextStyle(fontSize: 20),
              ),
              top: 15,
              right: 15,
            )
          ],
        ));
  }
}
