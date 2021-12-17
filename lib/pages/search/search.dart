import 'package:flok/components/bottom_navigation.dart';
import 'package:flok/components/constants.dart';
import 'package:flok/components/seacrhed_list.dart';
import 'package:flok/components/scroll_list.dart';
import 'package:flok/model/searched_film.dart';
import 'package:flok/request/request.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  String x = '';
  bool isTexting = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 56),
              width: MediaQuery.of(context).size.width-15,
              height: 60,
              child: TextField(
                onSubmitted: (text){
                  x = text;
                  // isTexting = false;
                },
                cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black
                  ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey[540]),
                  hintText: "Фильмы, сериалы",
                  icon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
              ),
            ),
          ),
          Container(
            child: Text(x),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: cheight,
              child: FutureBuilder<FilmSearched>(
                future: FilmsApi.getSearchFilm(x),
                builder: (context, snapshot)
                {
                  // if(isTexting = false)
                  // {
                  //   if(!snapshot.hasData)
                  //   {
                  //     return const Center(child: CircularProgressIndicator());
                  //   }
                  // }
                  if(!snapshot.hasData)
                    {
                      return const Center(child: CircularProgressIndicator());
                    }

                  final search = snapshot.data;

                  return ListView.builder(
                    itemCount: search == null ? 0 : search.films.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index)
                    {
                      final film = search!.films[index];
                      return ListSearched(film: film, heigth: cheight, width: cwidth);
                    }
                  );
                }
              ),
            ),
        ],
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}