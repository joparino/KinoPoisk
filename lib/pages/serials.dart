import 'package:flok/components/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'components/serial/serial_body.dart';


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