import 'package:flutter/cupertino.dart';

@immutable
class MyAppUser {
  const MyAppUser({
    required this.uid,
    this.email,
  });

  final String uid;
  final String? email;
}
