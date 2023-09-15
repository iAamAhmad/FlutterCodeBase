import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData? icon;
  final IconData? sufIcon;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.icon,
    this.sufIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        fillColor: Color.fromARGB(255, 236, 237, 238),
        filled: true,
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(icon),
        suffixIcon: Icon(sufIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
