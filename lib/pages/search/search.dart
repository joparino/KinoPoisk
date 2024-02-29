import 'package:flok/components/constants.dart';
import 'package:flok/components/seacrhed_list.dart';
import 'package:flok/model/searched_film.dart';
import 'package:flok/request/request.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  String x = ' ';
  bool isTexting = true;
  Future<FilmSearched>? myFuture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 56),
              width: MediaQuery.of(context).size.width - 15,
              height: 60,
              child: TextField(
                onSubmitted: (text) {
                  setState(() {
                    myFuture = FilmsApi().getSearchFilm(text);
                  });
                },
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey[540]),
                    hintText: "Фильмы, сериалы",
                    icon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<FilmSearched>(
                future: myFuture,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final search = snapshot.data;

                  return SizedBox(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: cheight - 40,
                          crossAxisCount: 2,
                        ),
                        shrinkWrap: true,
                        itemCount: search == null ? 0 : search.films.length,
                        itemBuilder: (context, index) {
                          final film = search!.films[index];
                          return ListSearched(
                              film: film,
                              heigth: cheight - 40,
                              width: cwidth - 20);
                        }),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
