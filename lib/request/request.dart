import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flok/model/details_film.dart';
import 'package:flok/model/searched_film.dart';
import 'package:flok/model/top_film.dart';
import 'package:http/http.dart' as http;


class FilmsApi{

  static Future<List<Film>> getTopPopular() async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_100_POPULAR_FILMS&page=1');
    Map<String, String> headers = HashMap();
    headers.addAll({'X-API-KEY': 'c02232f2-6940-45e2-be79-bc333cac1da7'});
    headers.addAll({'content-type': 'application/json'});
    headers.addAll({'Charset': 'utf-8'});

    final response = await http.get(
      url,
      headers: headers,
    );
    final responseText = utf8.decode(response.bodyBytes);
    final x = json.decode(responseText);
    return List<Film>.from(x["films"].map((e) => Film.fromJson(e)).toList());
  }

  static Future<List<Film>> getTopAwait() async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_AWAIT_FILMS&page=1');
    Map<String, String> headers = HashMap();
    headers.addAll({'X-API-KEY': 'c02232f2-6940-45e2-be79-bc333cac1da7'});
    headers.addAll({'content-type': 'application/json'});
    headers.addAll({'Charset': 'utf-8'});

    final response = await http.get(
      url,
      headers: headers,
    );
    final responseText = utf8.decode(response.bodyBytes);
    final x = json.decode(responseText);
    return List<Film>.from(x["films"].map((e) => Film.fromJson(e)).toList());
  }

  static Future<List<Film>> getTopBest() async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=1');
    Map<String, String> headers = HashMap();
    headers.addAll({'X-API-KEY': 'c02232f2-6940-45e2-be79-bc333cac1da7'});
    headers.addAll({'content-type': 'application/json'});
    headers.addAll({'Charset': 'utf-8'});

    final response = await http.get(
      url,
      headers: headers,
    );
    final responseText = utf8.decode(response.bodyBytes);
    final x = json.decode(responseText);
    return List<Film>.from(x["films"].map((e) => Film.fromJson(e)).toList());
  }

  static Future<DetailsFilm> getDetailsFilm(filmId) async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/$filmId');
    Map<String, String> headers = HashMap();
    headers.addAll({'X-API-KEY': 'c02232f2-6940-45e2-be79-bc333cac1da7'});
    headers.addAll({'content-type': 'application/json'});
    headers.addAll({'Charset': 'utf-8'});

    final response = await http.get(
      url,
      headers: headers,
    );
    final responseText = utf8.decode(response.bodyBytes);
    final x = json.decode(responseText);
    DetailsFilm detailsFilm = DetailsFilm.fromJson(x);
    return detailsFilm;
  }

  static Future<FilmSearched> getSearchFilm(name) async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-keyword?keyword=$name');
    Map<String, String> headers = HashMap();
    headers.addAll({'X-API-KEY': 'c02232f2-6940-45e2-be79-bc333cac1da7'});
    headers.addAll({'content-type': 'application/json'});
    headers.addAll({'Charset': 'utf-8'});

    final response = await http.get(
      url,
      headers: headers,
    );
    final responseText = utf8.decode(response.bodyBytes);
    final x = json.decode(responseText);
    print(response.statusCode);
    FilmSearched searchedFilm = FilmSearched.fromJson(x);
    return searchedFilm;
  }
}

main () async{
  String name = "Eвангелион";
  Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-keyword?keyword=$name');
    Map<String, String> headers = HashMap();
    headers.addAll({'X-API-KEY': 'c02232f2-6940-45e2-be79-bc333cac1da7'});
    headers.addAll({'content-type': 'application/json'});
    headers.addAll({'Charset': 'utf-8'});

    final response = await http.get(
      url,
      headers: headers,
    );
    final responseText = utf8.decode(response.bodyBytes);
    final x = json.decode(responseText);
    //print(x);\
    FilmSearched searchedFilm = FilmSearched.fromJson(x);
    print(searchedFilm.films[0].description);
}