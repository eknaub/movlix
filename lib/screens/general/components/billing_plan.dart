import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';
import 'package:movlix/widgets/rounded_elevated_button_small.dart';

class BillingPlan extends StatefulWidget {
  const BillingPlan({Key? key}) : super(key: key);

  @override
  State<BillingPlan> createState() => _BillingPlanState();
}

class _BillingPlanState extends State<BillingPlan> {
  int businessPlanRadioValue = 2;
  int billingPeriodRadioValue = 1;
  bool renew = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Update plan',
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
            'Business plan',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            title: const Text(
              "Professional (\$29 per month)",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Radio(
              value: 1,
              groupValue: businessPlanRadioValue,
              onChanged: (int? value) {
                setState(() {
                  businessPlanRadioValue = value ?? -1;
                });
              },
              activeColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.white.withOpacity(.32);
                  }
                  return Colors.white;
                },
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "Business (\$39 per month)",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Radio(
              value: 2,
              groupValue: businessPlanRadioValue,
              onChanged: (int? value) {
                setState(() {
                  businessPlanRadioValue = value ?? -1;
                });
              },
              activeColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.white.withOpacity(.32);
                  }
                  return Colors.white;
                },
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "Enterprise (\$49 per month)",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Radio(
              value: 3,
              groupValue: businessPlanRadioValue,
              onChanged: (int? value) {
                setState(() {
                  businessPlanRadioValue = value ?? -1;
                });
              },
              activeColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.white.withOpacity(.32);
                  }
                  return Colors.white;
                },
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text(
            'Billing period',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            title: const Text(
              "Monthly",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Radio(
              value: 1,
              groupValue: billingPeriodRadioValue,
              onChanged: (int? value) {
                setState(() {
                  billingPeriodRadioValue = value ?? -1;
                });
              },
              activeColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.white.withOpacity(.32);
                  }
                  return Colors.white;
                },
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "Yearly (Save 20%)",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Radio(
              value: 2,
              groupValue: billingPeriodRadioValue,
              onChanged: (int? value) {
                setState(() {
                  billingPeriodRadioValue = value ?? -1;
                });
              },
              activeColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.white.withOpacity(.32);
                  }
                  return Colors.white;
                },
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text(
            'Auto-renew',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              const Text(
                'Your subscription will renew on July 28, 2022',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 24.0,
              ),
              Switch(
                value: renew,
                onChanged: (bool value) {
                  renew = value;
                  setState(() {});
                },
                activeColor: Colors.white,
              )
            ],
          ),
          const SizedBox(
            height: 24.0,
          ),
          Row(
            children: const [
              Text(
                'Total',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 24.0,
              ),
              Text(
                '\$500.00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
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
            title: 'Update plan',
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
