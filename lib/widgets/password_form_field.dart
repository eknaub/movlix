import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';

class PasswordFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const PasswordFormField(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (String? value) {
        return (value != null && value.isEmpty)
            ? 'Please enter a password'
            : null;
      },
      obscureText: true,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: const Icon(Icons.lock, color: kGreyColor),
        fillColor: kGreyColor.withOpacity(0.3),
        filled: true,
        hintStyle: const TextStyle(color: kGreyColor),
      ),
    );
  }
}
