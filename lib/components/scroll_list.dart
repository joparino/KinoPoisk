import 'package:flok/components/constants.dart';
import 'package:flok/model/top_film.dart';
import 'package:flok/pages/details/description.dart';
import 'package:flutter/material.dart';

class ListFilm extends StatelessWidget {
  const ListFilm({
    Key? key,
    required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>  DescriptionPage(film.filmId),
                ));
              },
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.network(
                    film.posterUrlPreview,
                    width: cwidth,
                    height: cheight,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}