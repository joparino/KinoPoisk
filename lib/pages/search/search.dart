import 'package:flok/components/constants.dart';
import 'package:flok/components/plate_film.dart';
import 'package:flok/model/film.dart';
import 'package:flok/request/request.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  Future<FilmSearched>? serchedFilm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSearchTextField(context),
          _buildListOfSearchedFilms(),
        ],
      ),
    );
  }

  Expanded _buildListOfSearchedFilms() {
    return Expanded(
      child: FutureBuilder<FilmSearched>(
        future: serchedFilm,
        builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        List<Film> searchedFilms = snapshot.data!.films;

        return SizedBox(
          child: GridView.builder(
            padding: const EdgeInsets.only(left: 18, top: 15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: cheight - 40,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            itemCount: searchedFilms.length,
            itemBuilder: (context, index) {
              final film = searchedFilms[index];
              return PlateFilmRow(film: film, heigth: cheight - 40, width: cwidth - 20);
            }
          ),
        );
      }),
    );
  }

  Center _buildSearchTextField(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 14, right: 14),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: TextField(
          onSubmitted: (text) {
            setState(() {
              serchedFilm = FilmsApi().getSearchFilm(text);
            });
          },
          cursorColor: Colors.black,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey[540]),
            hintText: "Введите название для поиска",
            prefixIcon: const Icon(Icons.search, size: 36),
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12)
            )
          ),
        ),
      ),
    );
  }
}
