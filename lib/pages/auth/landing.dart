import 'package:flok/main.dart';
import 'package:flok/pages/auth/auth.dart';
import 'package:flok/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Landind extends StatelessWidget {
  const Landind({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthUser? user = Provider.of<AuthUser?>(context);
    final bool isLoggedIn = user !=null;

    return isLoggedIn ? const HomePage() : Authorization();
  }
}