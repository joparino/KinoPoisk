import 'package:flok/model/searched_film.dart';
import 'package:flok/pages/details/description.dart';
import 'package:flutter/material.dart';

class ListSearched extends StatelessWidget {
  const ListSearched({
    super.key,
    required this.film, required this.heigth, required this.width,
  });

  final FilmS film;
  final double heigth;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=>  DescriptionPage(film.filmId),
            ));
          },
          child: Container(
            margin: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                film.posterUrlPreview,
                width: width,
                height: heigth,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}