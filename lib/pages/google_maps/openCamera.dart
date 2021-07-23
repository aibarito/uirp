import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uirp/components/roundedButton.dart';

import '../../constants.dart';

class OpenCamera extends StatelessWidget {
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
    return Container(
      child: RoundedButton(
        text: "Open camera",
        callback: () {
          selectImage();
        },
        color: primaryColor,
        textColor: Colors.white,
      ),
    );
  }
}
