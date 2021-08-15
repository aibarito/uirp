import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uirp/components/roundedButton.dart';

import '../../constants.dart';

class ScanQR extends StatelessWidget {
  final _picker = ImagePicker();
  selectImage() async {
    final pickedFile;
    pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: ElevatedButton(
      onPressed: () async {
        String scanning = await BarcodeScanner.scan();
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('The Qr is'),
                  content: Text(scanning),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ));
      },
      child: Text("Scan QR code"),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: size.height * 0.03)),
          backgroundColor: MaterialStateProperty.all(primaryColor)),
    ));
  }
}
