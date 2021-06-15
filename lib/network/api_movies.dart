import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:practica2/models/popularDAO.dart';

class ApiMovies {
  final String URL_POPULAR = "";
  Client http = Client();

  Future<List<Results>?> getPopular() async {
    final response = await http.get(URL_POPULAR);

    if (response.statusCode == 200) {
      var movies = jsonDecode(response.body)['results'] as List;
      List<Results> listMovies =
          movies.map((movies) => Results.fromMap(movies)).toList();
    } else {
      return null;
    }
  }
}
