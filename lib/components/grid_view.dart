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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                image,
                width: cwidth-10,
                height: cheight-100,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}