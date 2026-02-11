import 'package:flok/model/film.dart';
import 'package:flutter/material.dart';

import 'package:flok/components/constants.dart';
import 'package:flok/components/plate_film.dart';

class GridPlatesFilms extends StatelessWidget {
  const GridPlatesFilms({
    super.key,
    required this.listFilms
  });

  final List<Film> listFilms;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 250,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemCount: listFilms.length,
      itemBuilder: (context, index) {
        final film = listFilms[index];
        return PlateFilmColumn.withIdAndUrl(
          url: film.posterUrl ?? '',
          id: film.externalId,
          height: cheight - 40,
          width: cwidth - 20,
        );
      },
    );
  }
}
