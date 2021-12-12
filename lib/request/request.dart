import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flok/model/details_film.dart';
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
}

main () async{
  Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/312');
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
    print(detailsFilm.genres.length);
    for(int i = 0; i <=detailsFilm.genres.length; i++){
      print((detailsFilm.countries[i].country));
    }


  Uri url1 = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=1');
    Map<String, String> headers1 = HashMap();
    headers1.addAll({'X-API-KEY': 'c02232f2-6940-45e2-be79-bc333cac1da7'});
    headers1.addAll({'content-type': 'application/json'});
    headers1.addAll({'Charset': 'utf-8'});

    final response1 = await http.get(
      url1,
      headers: headers1,
    );
    final responseText1 = utf8.decode(response1.bodyBytes);
    final x1 = json.decode(responseText1);
    print(List<Film>.from(x1["films"].map((e) => Film.fromJson(e)).toList()).runtimeType);
}