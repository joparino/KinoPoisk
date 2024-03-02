import 'package:flok/components/constants.dart';
import 'package:flok/components/plate_film.dart';
import 'package:flok/model/top_film.dart';
import 'package:flok/request/request.dart';
import 'package:flutter/material.dart';


class FilmsPage extends StatelessWidget {
  const FilmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: const Text('Медиа',
                style: TextStyle(fontSize: 36),
                ),
              ),

              const TitleListFilm(title: "Популярно сейчас"),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: cheight - 20,
                child: FutureBuilder<List<Film>>(
                  future: FilmsApi().getTopPopular(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    
                    List<Film> films = snapshot.data!;
                    return ListView.builder(
                      itemCount: films.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return PlateFilmRow(film: films[index], heigth: cheight - 20, width: cwidth - 15);
                      }
                    );
                  }
                ),
              ),

              const TitleListFilm(title: "Самые ожидаемые"),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height:  cheight - 60,
                child: FutureBuilder<List<Film>>(
                  future: FilmsApi().getTopAwait(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
          
                    List<Film> films = snapshot.data!;
                    return ListView.builder(
                      itemCount: films.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return PlateFilmRow(film: films[index], heigth: cheight - 50, width: cwidth - 35);
                      }
                    );
                  }
                ),
              ),

              const TitleListFilm(title: "Топ-20 фильмов"),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: cheight - 60,
                child: FutureBuilder<List<Film>>(
                  future: FilmsApi().getTopBest(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
          
                    List<Film> films = snapshot.data!;
                    return ListView.builder(
                      itemCount: films.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return PlateFilmRow(film: films[index], heigth: cheight - 50, width: cwidth - 35);
                      }
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TitleListFilm extends StatelessWidget {
  const TitleListFilm({
    super.key,
    required this.title
  });

  final EdgeInsets marginTitle = const EdgeInsets.only(top: 10, bottom: 6);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginTitle,
      child: Text(title,
      style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
