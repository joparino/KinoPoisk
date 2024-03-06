import 'package:flutter/material.dart';

import 'package:flok/model/top_film.dart';
import 'package:flok/pages/details/description.dart';

class PlateFilm extends StatelessWidget {
  const PlateFilm({
    super.key,
    required this.film,
    required this.width,
    required this.heigth,
  });

  final Film film;
  final double width;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}


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
          child: PlateFilm(film: film, width: width, heigth: heigth),
        ),
      ],
    );
  }
}


class PlateFilmColumn extends StatelessWidget {
  const PlateFilmColumn({
    super.key,
    required this.film, 
    required this.heigth, 
    required this.width,
  });
  PlateFilmColumn.withIdAndUrl({key, required String url, required int id, required double height, required double width})
   : this(key: key, film: Film(filmId: id, posterUrlPreview: url), heigth: height, width: width);

  final Film film;
  final double heigth;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => DescriptionPage(film.filmId),
            )
          );
          },
          child: PlateFilm(film: film, width: width, heigth: heigth),
        ),
      ],
    );
  }
}
