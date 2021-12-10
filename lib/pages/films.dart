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
      body: FutureBuilder<List<ModelFilm>>(
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
            itemBuilder: (context, index)
            {
              final film = films[index];
              return  ListFilm(image: film.;
            }
          );
        }
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}