import 'package:flok/main.dart';
import 'package:flok/pages/auth/auth.dart';
import 'package:flok/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthUser? user = Provider.of<AuthUser?>(context);
    final bool isLoggedIn = user != null;

    return isLoggedIn ? const MainWindow() : const Authorization();
  }
}
