import 'package:flutter/material.dart';

class InfoPopUpCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Material(
        color: Colors.amber[200],
        child: Container(
            width: size.width * 0.8,
            height: size.height * 0.5,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Used: 100 miled",
                  style: TextStyle(fontSize: 30, color: Colors.blue),
                ),
                Text("earned: 100 tokens",
                    style: TextStyle(fontSize: 30, color: Colors.blue))
              ],
            )),
      ),
    );
  }
}
