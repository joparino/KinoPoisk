import 'dart:async';
import 'dart:convert';
import 'package:flok/model/details_film.dart';
import 'package:flok/model/searched_film.dart';
import 'package:flok/model/top_film.dart';
import 'package:http/http.dart' as http;


class FilmsApi{

  Map<String, String> headers = {'X-API-KEY': 'c02232f2-6940-45e2-be79-bc333cac1da7', 'content-type': 'application/json'};

  Future<List<Film>> getTopPopular() async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_100_POPULAR_FILMS&page=1');

    final response = await http.get(
      url,
      headers: headers,
    );
    final responseText = utf8.decode(response.bodyBytes);
    final responseJson = json.decode(responseText);
    return List<Film>.from(responseJson["films"].map((e) => Film.fromJson(e)).toList());
  }

  Future<List<Film>> getTopAwait() async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_AWAIT_FILMS&page=1');

    final response = await http.get(
      url,
      headers: headers,
    );
    final responseText = utf8.decode(response.bodyBytes);
    final responseJson = json.decode(responseText);
    return List<Film>.from(responseJson["films"].map((e) => Film.fromJson(e)).toList());
  }

  Future<List<Film>> getTopBest() async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=1');

    final response = await http.get(
      url,
      headers: headers,
    );
    final responseText = utf8.decode(response.bodyBytes);
    final responseJson = json.decode(responseText);
    return List<Film>.from(responseJson["films"].map((e) => Film.fromJson(e)).toList());
  }

  Future<DetailsFilm> getDetailsFilm(filmId) async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/$filmId');

    final response = await http.get(
      url,
      headers: headers,
    );
    final responseText = utf8.decode(response.bodyBytes);
    final responseJson = json.decode(responseText);
    DetailsFilm detailsFilm = DetailsFilm.fromJson(responseJson);
    return detailsFilm;
  }

  Future<FilmSearched> getSearchFilm(name) async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-keyword?keyword=$name');

    final response = await http.get(
      url,
      headers: headers,
    );
    final responseText = utf8.decode(response.bodyBytes);
    final responseJson = json.decode(responseText);

    FilmSearched searchedFilm = FilmSearched.fromJson(responseJson);
    return searchedFilm;
  }
}