import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';

class SearchFormField extends StatelessWidget {
  final TextEditingController controller;

  const SearchFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (String? value) {
        return (value != null && value.isEmpty) ? 'Please enter a text' : null;
      },
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Write a question or problem',
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        fillColor: kGreyColor.withOpacity(0.3),
        filled: true,
        hintStyle: const TextStyle(color: kGreyColor),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kGreyColor),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
