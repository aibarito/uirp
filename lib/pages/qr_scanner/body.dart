import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:uirp/pages/qr_scanner/background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String qrState = "not Scanned";
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            ElevatedButton(
              onPressed: () async {
                String scanning = await BarcodeScanner.scan();
                setState(() {
                  qrState = scanning;
                });
              },
              child: Text("Scan QR code"),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
                  backgroundColor: MaterialStateProperty.all(Colors.amber)),
            )
          ],
        ),
      )),
    );
  }
}
