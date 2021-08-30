import 'dart:convert';
import 'package:http/http.dart' as http;

class JokeRepository {
  final String url = 'https://api.checknorris.io/jokes';

  Future<List<String>> getCategories() async {
    final response = await http.get(Uri.parse('$url/categories'));
    final decoded = jsonDecode(response.body) as List;
    return List.generate(decoded.length, (i) => decoded[i]);
  }
}
