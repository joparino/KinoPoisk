import 'dart:async' show Future, TimeoutException;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/animation.dart';
import 'package:http/http.dart' as http;

main() async {
  Uri url = Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=1');
  Map<String, String> headers = HashMap();
  headers.addAll({'X-API-KEY': 'c02232f2-6940-45e2-be79-bc333cac1da7'});
  headers.addAll({'content-type': 'application/json'});

  http.Response response = await http.get(
      url,
      headers: headers,
  );
  
  var responseText = utf8.decode(response.bodyBytes);
  Map<String, dynamic> x = json.decode(responseText);
  print(x["pagesCount"]);

  

  try {
    http.Response response = await http.get(
      url,
      headers: headers,
    )
    .timeout(const Duration(seconds: 1));
  } on TimeoutException catch (e) {
    print('Timeout');
  } on Error catch (e) {
    print('Error: $e');
  }
}