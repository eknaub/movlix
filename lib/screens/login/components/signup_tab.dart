import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movlix/screens/main/movie_main_screen.dart';
import 'package:movlix/services/firebase_auth_service.dart';
import 'package:movlix/utils/constants.dart';
import 'package:movlix/widgets/email_form_field.dart';
import 'package:movlix/widgets/password_form_field.dart';
import 'package:movlix/widgets/rounded_elevated_button.dart';

class SignupTab extends StatefulWidget {
  const SignupTab({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupTab> createState() => _SignupTabState();
}

class _SignupTabState extends State<SignupTab> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController repeatPasswordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? errorMsg;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 36),
              child: RichText(
                text: const TextSpan(
                  text: 'Sign up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  children: [
                    TextSpan(
                      text: ' a new account',
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
              height: 12.0,
            ),
            PasswordFormField(
              controller: passwordController,
              hintText: 'Password',
            ),
            const SizedBox(
              height: 12.0,
            ),
            PasswordFormField(
              controller: repeatPasswordController,
              hintText: 'Repeat password',
            ),
            const SizedBox(
              height: 12.0,
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
                title: 'Sign up',
                color: Colors.purple.shade800,
                onPressed: () async {
                  setState(
                    () {
                      errorMsg = '';
                    },
                  );
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    bool passwordsMatch = passwordController.text ==
                        repeatPasswordController.text;
                    if (passwordsMatch) {
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                        if (newUser != null) {
                          if (!mounted) return;
                          emailController.text = '';
                          passwordController.text = '';
                          repeatPasswordController.text = '';
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const MovieScreen(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        setState(
                          () {
                            errorMsg = e.message;
                          },
                        );
                      }
                    } else {
                      setState(
                        () {
                          errorMsg = 'Passwords do not match';
                        },
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
