import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomDesription extends StatelessWidget {
  const BottomDesription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/heart.svg')
            ),
            IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/eyeoutline.svg')
            ),
            IconButton(
            onPressed: () {}, 
            icon: SvgPicture.asset('assets/icons/bookmark.svg')
            ),
          ],
      ),
    );
  }
}