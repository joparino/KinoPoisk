import 'package:flok/main.dart';
import 'package:flok/pages/films.dart';
import 'package:flok/pages/profile/profile_body.dart';
import 'package:flok/pages/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class bottomNavigation extends StatelessWidget {
  const bottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> HomePage(),
                ),
              );
            },
            icon: SvgPicture.asset('assets/icons/avatar.svg')
            ),
            IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> FilmsPage(),
                ),
              );
            },
            icon: SvgPicture.asset('assets/icons/camera.svg')
            ),
            IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> SearchPage(),
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