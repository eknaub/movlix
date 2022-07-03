import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';
import 'package:movlix/widgets/email_form_field.dart';
import 'package:movlix/widgets/password_form_field.dart';

class LoginTab extends StatefulWidget {
  final Function onForgotPasswordPressed;
  const LoginTab({Key? key, required this.onForgotPasswordPressed})
      : super(key: key);

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    print('ok');
                  }
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
