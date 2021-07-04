import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/providers/selectPayment.dart';

class SelectPaymentRow extends StatelessWidget {
  const SelectPaymentRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<SelectPayment>(builder: (context, payment, child) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        height: size.height * 0.03,
        width: size.width * 0.9,
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                payment.changeStateToStudentId();
              },
              child: Container(
                width: size.width * 0.45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: payment.studentId ? Colors.blue : Colors.transparent,
                    border: Border.all(color: Colors.blueAccent, width: 0.6)),
                child: Text(
                  "Student id",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                payment.changeStateToCreditCard();
              },
              child: Container(
                width: size.width * 0.45,
                decoration: BoxDecoration(
                    color:
                        !payment.studentId ? Colors.blue : Colors.transparent,
                    border: Border.all(color: Colors.blueAccent, width: 0.6)),
                alignment: Alignment.center,
                child: Text(
                  "Credit card",
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
