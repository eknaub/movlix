import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';

class Preferences extends StatefulWidget {
  const Preferences({Key? key}) : super(key: key);

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  bool darkModeSwitch = true;
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Preferences',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          Row(
            children: [
              const Text(
                'Language',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 24.0,
              ),
              DropdownButton<String>(
                value: dropdownValue,
                elevation: 16,
                style: const TextStyle(color: Colors.white),
                dropdownColor: kDrawerColor,
                focusColor: kScaffoldColor,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['English', 'German']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
          Row(
            children: [
              const Text(
                'Darkmode',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 24.0,
              ),
              Switch(
                value: darkModeSwitch,
                onChanged: (bool value) {
                  darkModeSwitch = value;
                  setState(() {});
                },
                activeColor: Colors.white,
              )
            ],
          ),
        ],
      ),
    );
  }
}
