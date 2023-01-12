import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  var client = http.Client();

  Future<String> getNumberTrivia() async {
    Uri numberAPIURL = Uri.parse('http://numbersapi.com/random/trivia?json');
    final response = await client.get(numberAPIURL);
    if (response.statusCode == 200) {
      final Map triviaJSON = jsonDecode(response.body);
      return triviaJSON['text'];
    } else {
      return 'Failed to fetch number trivia';
    }
  }
}