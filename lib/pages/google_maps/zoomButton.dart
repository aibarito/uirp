import 'package:flutter/material.dart';

class ZoomButton extends StatelessWidget {
  const ZoomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Function() onPressed;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        child: text,
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
        ),
      ),
    );
  }
}
