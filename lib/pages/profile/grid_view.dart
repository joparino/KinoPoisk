import 'package:flok/components/constants.dart';
import 'package:flok/pages/details/description.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({ Key? key, required this.film,required this.image}) : super(key: key);

  final int film;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>  DescriptionPage(film),
            ));
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.network(
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