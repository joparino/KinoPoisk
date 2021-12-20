import 'package:firebase_core/firebase_core.dart';
import 'package:flok/pages/auth/auth.dart';
import 'package:flok/pages/auth/landing.dart';
import 'package:flok/pages/profile/profile_body.dart';
import 'package:flok/components/bottom_navigation.dart';
import 'package:flok/services/auth.dart';
import 'package:flok/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AuthUser?>.value(
      value: AuthService().currentUser,
      initialData: null,
      child: MaterialApp(
        title: 'Sample App',
        theme: ThemeData(
          primaryColor: Colors.white,
          brightness: Brightness.light,
        ),
        home: Landind(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: MainWindow(),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      shadowColor: Colors.white,
      backgroundColor: Colors.white,
      actions: [
        TextButton.icon(
            onPressed: () {
              AuthService().logOut();
            },
            icon: Icon(Icons.logout, color: Colors.black),
            label: SizedBox.shrink())
      ],
    );
  }
}
