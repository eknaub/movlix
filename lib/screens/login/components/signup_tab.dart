import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';
import 'package:movlix/widgets/email_form_field.dart';
import 'package:movlix/widgets/password_form_field.dart';

class SignupTab extends StatefulWidget {
  const SignupTab({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupTab> createState() => _SignupTabState();
}

class _SignupTabState extends State<SignupTab> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController repeatPasswordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            const SizedBox(
              height: 24.0,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    print("OK");
                  }
                },
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
