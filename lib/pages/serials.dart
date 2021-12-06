import 'package:flok/components/bottom_navigation.dart';
import 'package:flok/pages/serial/serial_body.dart';
import 'package:flutter/material.dart';


class SerialPage extends StatelessWidget {
  const SerialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodySerial(),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}