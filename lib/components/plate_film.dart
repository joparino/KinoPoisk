import 'package:flok/model/top_film.dart';
import 'package:flok/pages/details/description.dart';
import 'package:flutter/material.dart';


class PlateFilmRow extends StatelessWidget {
  const PlateFilmRow({
    super.key,
    required this.film, 
    required this.heigth, 
    required this.width,
  });

  final Film film;
  final double heigth;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => DescriptionPage(film.filmId),
            )
          );
          },
          child: Container(
            margin: const EdgeInsets.only(right: 14),
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
