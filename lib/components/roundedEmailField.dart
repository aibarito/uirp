import 'package:flutter/material.dart';
import 'package:uirp/components/textField.dart';

class RoundedEmailField extends StatelessWidget {
  final String hint;
  final ValueChanged<String> onChanged;
  final Icon icon;
  const RoundedEmailField({
    Key? key,
    required this.hint,
    required this.onChanged,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      decoration:
          InputDecoration(icon: icon, hintText: hint, border: InputBorder.none),
    ));
  }
}
