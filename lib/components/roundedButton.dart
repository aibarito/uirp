import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
              backgroundColor: MaterialStateProperty.all(color)),
        ),
      ),
    );
  }
}
