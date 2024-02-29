import 'package:firebase_core/firebase_core.dart';
import 'package:flok/pages/auth/landing.dart';
import 'package:flok/pages/films.dart';
import 'package:flok/pages/profile/user_page.dart';
import 'package:flok/pages/search/search.dart';
import 'package:flok/services/auth.dart';
import 'package:flok/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        home: const Landind(),
      ),
    );
  }
}


class MainWindow extends StatefulWidget{
  const MainWindow({super.key});

  @override
  State<MainWindow> createState() => _MainWindow();
}

class _MainWindow extends State<MainWindow> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: buildNavigationBar(),
      body: [const UserPage(), const FilmsPage(), const SearchPage()][currentPageIndex]
    );
  }

  NavigationBar buildNavigationBar() {
    return NavigationBar(
      onDestinationSelected: (int index){
        setState(() {
          currentPageIndex = index;
        });
      },
      indicatorColor: Colors.amber,
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined), 
          label: "Home"
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.thumb_up),
          icon: Icon(Icons.thumb_up_outlined), 
          label: "Tops"
        ),
        NavigationDestination(
          icon: Icon(Icons.search), 
          label: "Search"
        )  
      ]
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
            icon: const Icon(Icons.logout, color: Colors.black),
            label: const SizedBox.shrink())
      ],
    );
  }
}
