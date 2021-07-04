import 'package:flutter/material.dart';
import '../../constants.dart';

class BorderedLink extends StatelessWidget {
  const BorderedLink({
    Key? key,
    required this.press,
    required this.text,
  }) : super(key: key);
  final String text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black, width: 0.1))),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: press,
                child: Text(
                  text,
                  style: TextStyle(color: primaryColor, fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
