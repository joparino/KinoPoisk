import 'package:flok/main.dart';
import 'package:flok/pages/films.dart';
import 'package:flok/pages/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20,right: 20),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> const HomePage(),
                ),
              );
            },
            icon: SvgPicture.asset('assets/icons/avatar.svg')
            ),
            IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> const FilmsPage(),
                ),
              );
            },
            icon: SvgPicture.asset('assets/icons/camera.svg')
            ),
            IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> const SearchPage(),
                ),
              );
            },
            icon: SvgPicture.asset('assets/icons/search.svg')
            ),
          ],
      ),
    );
  }
}
