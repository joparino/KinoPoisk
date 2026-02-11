import 'dart:convert';
import 'package:flok/model/details_film.dart';
import 'package:flok/model/film.dart';
import 'package:http/http.dart' as http;


class FilmsApi{

  final String tmdbApiKey = const String.fromEnvironment('TMDB_API_KEY');
  Map<String, String> headers = {'content-type': 'application/json'};

  Future<Map<String, dynamic>> baseRequestToTmdb(
    String unencodedPath, {
    Map<String, String>? queryParameters,
  }) async {
    if (tmdbApiKey.isEmpty) {
      throw StateError('TMDB_API_KEY is missing. Pass it via --dart-define=TMDB_API_KEY=...');
    }

    final Map<String, String> params = {
      'api_key': tmdbApiKey,
      'language': 'ru-RU',
      ...?queryParameters,
    };

    final Uri url = Uri.https(
      'api.themoviedb.org',
      unencodedPath,
      params,
    );

    final response = await http.get(url, headers: headers);
    if (response.statusCode != 200) {
      throw Exception('TMDB request failed: ${response.statusCode} ${response.body}');
    }

    final dynamic responseJson = json.decode(utf8.decode(response.bodyBytes));
    return responseJson as Map<String, dynamic>;
  }

  Future<List<Film>> baseGetFilmList(
    String unencodedPath, {
    Map<String, String>? queryParameters,
  }) async {
    final Map<String, dynamic> responseJson = await baseRequestToTmdb(
      unencodedPath,
      queryParameters: {'page': '1', ...?queryParameters},
    );
    final List<dynamic> results = (responseJson['results'] ?? const []) as List<dynamic>;
    return List<Film>.from(results.map((dynamic e) => Film.fromJson(e as Map<String, dynamic>)));
  }

  Future<List<Film>> getTopPopular() async {
    return await baseGetFilmList('/3/movie/popular');
  }

  Future<List<Film>> getTopAwait() async {
    return await baseGetFilmList('/3/movie/upcoming');
  }

  Future<List<Film>> getTopBest() async {
    return await baseGetFilmList('/3/movie/top_rated');
  }

  Future<DetailsFilm> getDetailsFilm(int filmId) async {
    final Map<String, dynamic> responseJson = await baseRequestToTmdb('/3/movie/$filmId');
    return DetailsFilm.fromJson(responseJson);
  }

  Future<FilmSearched> getSearchFilm(String name) async {
    final String query = name.trim();
    if (query.isEmpty) {
      return FilmSearched(keyword: '', films: const []);
    }

    final Map<String, dynamic> responseJson = await baseRequestToTmdb(
      '/3/search/multi',
      queryParameters: {
        'query': query,
        'page': '1',
        'include_adult': 'false',
      },
    );
    final List<dynamic> results = (responseJson['results'] ?? const []) as List<dynamic>;
    final List<Film> films = List<Film>.from(
      results.map((dynamic e) => Film.fromJson(e as Map<String, dynamic>)),
    );

    return FilmSearched(keyword: query, films: films);
  }
}
