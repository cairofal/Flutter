import 'dart:convert';
import 'package:flucknorris/models/joke_model.dart';
import 'package:http/http.dart' as http;

class JokeRepository {
  final String url = 'https://api.chucknorris.io/jokes';

  Future<List<String>> getCategories() async {
    try {
      final response = await http.get(Uri.parse('$url/categories'));
      final decoded = jsonDecode(response.body) as List;
      return List.generate(decoded.length, (i) => decoded[i]);
    } on Exception {
      rethrow;
    }
  }

  Future getJokeByCategory(String category) async {
    final response =
        await http.get(Uri.parse('$url/random?category=$category'));
    final decoded = jsonDecode(response.body);
    final joke = JokeModel.fromJson(decoded);
    return joke;
  }
}
