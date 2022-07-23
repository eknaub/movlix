import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movlix/screens/main/movie_main_screen.dart';
import 'package:movlix/services/firebase_auth_service.dart';
import 'package:movlix/utils/constants.dart';
import 'package:movlix/widgets/email_form_field.dart';
import 'package:movlix/widgets/password_form_field.dart';
import 'package:movlix/widgets/rounded_elevated_button.dart';

class LoginTab extends StatefulWidget {
  final Function onForgotPasswordPressed;
  const LoginTab({Key? key, required this.onForgotPasswordPressed})
      : super(key: key);

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? errorMsg;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                  text: 'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  children: [
                    TextSpan(
                      text: ' to your account',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    widget.onForgotPasswordPressed();
                  },
                  child: const Text(
                    'Forgot password',
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            Column(
              children: [
                Center(
                  child: RoundedElevatedButton(
                    title: 'Login',
                    color: Colors.purple.shade800,
                    onPressed: () async {
                      if (kDebugMode) {
                        if (formKey.currentState != null &&
                            formKey.currentState!.validate()) {
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                            if (user != null) {
                              if (!mounted) return;
                              emailController.text = '';
                              passwordController.text = '';
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
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
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Center(
                  child: TextButton(
                    onPressed: () async {
                      try {
                        final user = await _auth.signInAnonymously();
                        if (user != null) {
                          if (!mounted) return;
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
                    },
                    child: const Text(
                      'Login anonymously',
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
