import 'dart:async';
import 'dart:convert';
import 'package:flok/model/details_film.dart';
import 'package:flok/model/searched_film.dart';
import 'package:flok/model/top_film.dart';
import 'package:http/http.dart' as http;


class FilmsApi{

  final String kinopoiskApiKey = const String.fromEnvironment('KINOPOISK_KEY');
  Map<String, String> headers = {'content-type': 'application/json'};

  Future<List<Film>> getTopPopular() async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_100_POPULAR_FILMS&page=1');
    headers.addAll({"X-API-KEY": kinopoiskApiKey});

    final response = await http.get(url, headers: headers);
    String responseText = utf8.decode(response.bodyBytes);
    dynamic responseJson = json.decode(responseText);
    return List<Film>.from(responseJson["films"].map((e) => Film.fromJson(e)).toList());
  }

  Future<List<Film>> getTopAwait() async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_AWAIT_FILMS&page=1');
    headers.addAll({"X-API-KEY": kinopoiskApiKey});

    final response = await http.get(url, headers: headers);
    String responseText = utf8.decode(response.bodyBytes);
    dynamic responseJson = json.decode(responseText);
    return List<Film>.from(responseJson["films"].map((e) => Film.fromJson(e)).toList());
  }

  Future<List<Film>> getTopBest() async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=1');
    headers.addAll({"X-API-KEY": kinopoiskApiKey});

    final response = await http.get(url, headers: headers);
    String responseText = utf8.decode(response.bodyBytes);
    dynamic responseJson = json.decode(responseText);
    return List<Film>.from(responseJson["films"].map((e) => Film.fromJson(e)).toList());
  }

  Future<DetailsFilm> getDetailsFilm(filmId) async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/$filmId');
    headers.addAll({"X-API-KEY": kinopoiskApiKey});

    final response = await http.get(url, headers: headers);
    String responseText = utf8.decode(response.bodyBytes);
    dynamic responseJson = json.decode(responseText);
    DetailsFilm detailsFilm = DetailsFilm.fromJson(responseJson);
    return detailsFilm;
  }

  Future<FilmSearched> getSearchFilm(name) async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-keyword?keyword=$name');
    headers.addAll({"X-API-KEY": kinopoiskApiKey});

    final response = await http.get(url, headers: headers);
    String responseText = utf8.decode(response.bodyBytes);
    dynamic responseJson = json.decode(responseText);
    FilmSearched searchedFilm = FilmSearched.fromJson(responseJson);
    return searchedFilm;
  }
}
