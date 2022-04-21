import 'package:flok/model/searched_film.dart';
import 'package:flok/pages/details/description.dart';
import 'package:flutter/material.dart';

class ListSearched extends StatelessWidget {
  const ListSearched({
    Key? key,
    required this.film, required this.heigth, required this.width,
  }) : super(key: key);

  final FilmS film;
  final double heigth;
  final double width;

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
        ),
      );
  }
}