import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';
import 'package:movlix/widgets/search_form_field.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Help',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
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
                child: const Text(
                  'Contact us',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 32.0,
          ),
          const Center(
            child: Text(
              'How can we help?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Center(
            child: SearchFormField(controller: searchController),
          ),
          const SizedBox(
            height: 32.0,
          ),
          Row(
            children: [
              const Text(
                'Popular Questions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
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
                child: Row(
                  children: const [
                    Text(
                      'All questions',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: kDrawerColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Question 1',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: kDrawerColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Question 2',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: kDrawerColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Question 3',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: kDrawerColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Question 4',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: kDrawerColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Question 5',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: kDrawerColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Question 6',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 32.0,
          ),
          const Text(
            'Help by category',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Card(
                color: kDrawerColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Category 1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kDrawerColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Entry 1',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kDrawerColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Entry 2',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kDrawerColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Entry 3',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kDrawerColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Entry 4',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: kDrawerColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Category 2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kDrawerColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Entry 1',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kDrawerColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Entry 2',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kDrawerColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Entry 3',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kDrawerColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Entry 4',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: kDrawerColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Category 3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kDrawerColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Entry 1',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kDrawerColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Entry 2',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kDrawerColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Entry 3',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kDrawerColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Entry 4',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
