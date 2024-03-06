import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flok/components/constants.dart';
import 'package:flok/components/plate_film.dart';

class GridPlatesFilms extends StatelessWidget {
  const GridPlatesFilms({
    super.key,
    required this.listFilms
  });

  final List<QueryDocumentSnapshot<Object?>> listFilms;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 250,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          children: listFilms.map<Widget>((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return PlateFilmColumn.withIdAndUrl(url: data['posterUrlPreview'], id: data['kinopoiskId'], height: cheight-40, width: cwidth-20);
          }).toList(),
        ),
      ),
    );
  }
}
