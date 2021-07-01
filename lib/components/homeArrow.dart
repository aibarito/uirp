import 'package:flutter/material.dart';
import 'package:uirp/pages/home_page/home.dart';

class HomeArrow extends StatelessWidget {
  const HomeArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 50,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (value) {
            return (HomePage());
          }));
        },
        child: Row(
          children: [
            Icon(Icons.arrow_back),
            Text(
              " home",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
