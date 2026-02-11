import 'package:flok/components/empy_films_data.dart';
import 'package:flok/components/grid_plates_films.dart';
import 'package:flok/model/film.dart';
import 'package:flok/services/database.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPage();
}

class _UserPage extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final Future<List<Film>> watchedFilms = DatabaseService().getListBySlug('watched');
    final Future<List<Film>> wantedFilms = DatabaseService().getListBySlug('planned');
    final Future<List<Film>> likedFilms = DatabaseService().getListBySlug('favorite');

    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          Container(
            constraints: const BoxConstraints.expand(height: 40),
            child: const TabBar(tabs: [
              Tab(text: "Просмотрено"),
              Tab(text: "Желаемое"),
              Tab(text: "Любимое"),
            ]),
          ),
          Expanded(
            child: TabBarView(children: [
              _buildTabListFilms(watchedFilms),
              _buildTabListFilms(wantedFilms),
              _buildTabListFilms(likedFilms)
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildTabListFilms(Future<List<Film>> listFilsm) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 5, left: 15),
      child: FutureBuilder<List<Film>>(
        future: listFilsm,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final films = snapshot.data ?? const <Film>[];
          if (films.isEmpty) {
            return const EmptyFilmsData();
          }

          return GridPlatesFilms(listFilms: films);
        },
      ),
    );
  }
}
