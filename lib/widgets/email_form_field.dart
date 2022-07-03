import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController controller;

  const EmailFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (String? value) {
        return (value != null && value.isEmpty)
            ? 'Please enter an email'
            : null;
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Email',
        suffixIcon: const Icon(Icons.email, color: kGreyColor),
        fillColor: kGreyColor.withOpacity(0.3),
        filled: true,
        hintStyle: const TextStyle(color: kGreyColor),
      ),
    );
  }
}
