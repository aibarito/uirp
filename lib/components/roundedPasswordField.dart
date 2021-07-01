import 'package:flutter/material.dart';
import 'package:uirp/components/textField.dart';

import '../constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
            obscureText: true,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: "password",
              icon: Icon(
                Icons.lock,
                color: primaryColor,
              ),
              suffixIcon: Icon(
                Icons.visibility,
                color: primaryColor,
              ),
              border: InputBorder.none,
            )));
  }
}
