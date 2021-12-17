import 'package:flok/main.dart';
import 'package:flok/pages/auth/auth.dart';
import 'package:flutter/material.dart';

class Landind extends StatelessWidget {
  const Landind({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = true;

    return isLoggedIn ? HomePage() : Authorization();
  }
}