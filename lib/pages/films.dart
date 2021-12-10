import 'package:flok/components/bottom_navigation.dart';
import 'package:flok/components/scroll_list.dart';
import 'package:flok/model/films.dart';
import 'package:flok/request/request.dart';
import 'package:flutter/material.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Film>>(
        future: FilmsApi.getTopFilm(),
        builder: (context, snapshot)
        {
          if(!snapshot.hasData)
          {
            return const Center(child: CircularProgressIndicator());
          }
          
          final films = snapshot.data;

          return ListView.builder(
            itemCount: films!.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index)
            {
              final film = films[index];
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 14),
                    child: ListFilm(image: film.posterUrlPreview)
                    ),
                ],
              );
            }
          );
        }
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}