import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movlix/services/firebase_auth_service.dart';
import 'package:movlix/utils/constants.dart';
import 'package:movlix/widgets/custom_dialogs.dart';
import 'package:movlix/widgets/email_form_field.dart';
import 'package:movlix/widgets/rounded_elevated_button.dart';

class ForgotPassword extends StatefulWidget {
  final Function onBackPressed;

  const ForgotPassword({Key? key, required this.onBackPressed})
      : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  late TextEditingController emailController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? errorMsg;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Reset password',
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
            EmailFormField(controller: emailController),
            const SizedBox(
              height: 24.0,
            ),
            errorMsg != null && errorMsg!.isNotEmpty
                ? Center(
                    child: Text(
                      errorMsg ?? '',
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                : Container(),
            errorMsg != null && errorMsg!.isNotEmpty
                ? const SizedBox(
                    height: 24.0,
                  )
                : Container(),
            Center(
              child: RoundedElevatedButton(
                title: 'Reset',
                color: Colors.purple.shade800,
                onPressed: () async {
                  if (kDebugMode || kProfileMode) {
                    if (formKey.currentState != null &&
                        formKey.currentState!.validate()) {
                      try {
                        await _auth.sendPasswordResetEmail(
                            email: emailController.text);
                      } on FirebaseAuthException catch (e) {
                        setState(
                          () {
                            errorMsg = e.message;
                          },
                        );
                      }
                    }
                  } else {
                    CustomDialogs.releaseModeDialog(
                      context: context,
                      func: () {
                        setState(
                          () {
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  widget.onBackPressed();
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
      ),
    );
  }
}
