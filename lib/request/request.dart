import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flok/model/films.dart';
import 'package:http/http.dart' as http;


class FilmsApi{
  static Future<List<ModelFilm>> getTopFilm() async {
    Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_100_POPULAR_FILMS&page=1');

    final response = await http.get(
      url,
      headers: {'X-API-KEY': 'c02232f2-6940-45e2-be79-bc333cac1da7'},
    );
    var responseText = utf8.decode(response.bodyBytes);
    final List x = json.decode(responseText);

    // try {
    //  http.Response response = await http.get(
    //    url,
    //    headers: headers,
    //  )
    //    .timeout(const Duration(seconds: 1));
    //  } on TimeoutException catch (e) {
    //    print('Timeout');
    //  } on Error catch (e) {
    //    print('Error: $e');
    //  }

    return x.map((e) => ModelFilm.fromJson(e)).toList();
  }
}