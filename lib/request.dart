import 'dart:async';
import 'dart:collection';
import 'package:http/http.dart' as http;

main() async {
  Uri url = Uri.parse('https://imdb-api.com/ru/API/Top250Movies/k_p4j7oduq');
   Map<String, String> headers = HashMap();
  headers.putIfAbsent('Accept', () => 'application/json');
  headers.putIfAbsent('Accept-Language', () => 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3');

  http.Response response = await http.get(
      url,
      headers: headers,
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

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