import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';
import 'package:movlix/widgets/password_form_field.dart';
import 'package:movlix/widgets/rounded_elevated_button_small.dart';

class PasswordSecurity extends StatefulWidget {
  const PasswordSecurity({Key? key}) : super(key: key);

  @override
  State<PasswordSecurity> createState() => _PasswordSecurityState();
}

class _PasswordSecurityState extends State<PasswordSecurity> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController passwordRepeatController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    passwordRepeatController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordRepeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Password & Security',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            const Text(
              'Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 316,
              child: PasswordFormField(
                controller: passwordController,
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Text(
              'Repeat password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 316,
              child: PasswordFormField(
                controller: passwordRepeatController,
                hintText: 'Repeat password',
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedElevatedButtonSmall(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(
                        'Success',
                        style: TextStyle(color: Colors.white),
                      ),
                      content: const Text(
                        'Congratulations, this feature does nothing.',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: kDrawerColor,
                      actions: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Thanks for nothing'),
                        ),
                      ],
                    ),
                  );
                },
                title: 'Save',
                color: Colors.green),
          ],
        ),
      ),
    );
  }
}
