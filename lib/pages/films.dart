import 'package:flok/components/bottom_navigation.dart';
import 'package:flok/pages/components/film/film_body.dart';
import 'package:flutter/material.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyFilm(),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}