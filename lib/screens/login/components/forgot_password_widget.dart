import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';

class ForgotPassword extends StatelessWidget {
  final Function onBackPressed;

  const ForgotPassword({Key? key, required this.onBackPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Forgot password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 36),
            child: RichText(
              text: const TextSpan(
                text: 'Enter your email to',
                style: TextStyle(
                  color: kGreyColor,
                  fontSize: 20.0,
                ),
                children: [
                  TextSpan(
                    text: ' reset ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  TextSpan(
                    text: 'your password!',
                    style: TextStyle(
                      color: kGreyColor,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Email',
              suffixIcon: const Icon(Icons.email, color: kGreyColor),
              fillColor: kGreyColor.withOpacity(0.3),
              filled: true,
              hintStyle: const TextStyle(color: kGreyColor),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade800,
                  padding: const EdgeInsets.all(24.0),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  fixedSize: const Size.fromWidth(150)),
              child: const Text('Reset'),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Center(
            child: TextButton(
              onPressed: () {
                onBackPressed();
              },
              child: const Text(
                'Back to login',
                style: TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
