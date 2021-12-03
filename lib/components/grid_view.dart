import 'dart:typed_data';

import 'package:flok/constants.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({ Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(bottom: 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                image,
                width: cwidth-20,
                height: cheight-40,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}