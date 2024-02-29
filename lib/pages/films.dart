import 'package:flok/components/bottom_navigation.dart';
import 'package:flok/components/constants.dart';
import 'package:flok/components/scroll_list.dart';
import 'package:flok/model/top_film.dart';
import 'package:flok/request/request.dart';
import 'package:flutter/material.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 42, left: 14),
              child: const Text('Фильмы и сериалы',
              style: TextStyle(fontSize: 28),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 2, left: 14),
              child: const Text('Популярно сейчас',
              style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: cheight-20,
              child: FutureBuilder<List<Film>>(
                future: FilmsApi().getTopPopular(),
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
                      return  ListFilm(film: film, heigth: cheight-20, width: cwidth-15);
                    }
                  );
                }
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 2, left: 14),
              child: const Text('Самые ожидаемые',
              style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height:  cheight-60,
              child: FutureBuilder<List<Film>>(
                future: FilmsApi().getTopAwait(),
                builder: (context, snapshot)
                {
                  if(!snapshot.hasData)
                  {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final films = snapshot.data;
            
                  return ListView.builder(
                    itemCount: films == null ? 0 : films.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index)
                    {
                      final film = films![index];
                      return ListFilm(film: film, heigth: cheight-50, width: cwidth-35);
                    }
                  );
                }
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 2, left: 14),
              child: const Text('Топ-20 фильмов',
              style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: cheight-50,
              child: FutureBuilder<List<Film>>(
                future: FilmsApi().getTopBest(),
                builder: (context, snapshot)
                {
                  if(!snapshot.hasData)
                  {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final films = snapshot.data;
            
                  return ListView.builder(
                    itemCount: films == null ? 0 : films.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index)
                    {
                      final film = films![index];
                      return  ListFilm(film: film, heigth: cheight-50, width: cwidth-35);
                    }
                  );
                }
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}