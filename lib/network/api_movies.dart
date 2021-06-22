import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:practica2/models/popularDAO.dart';

class ApiMovies {
  var url = Uri.parse(
      // 'https://api.themoviedb.org/3/movie/popular?api_key=5019e68de7bc112f4e4337a500b96c56&language=es-MX&page=1');
      'https://api.themoviedb.org/3/movie/popular?api_key=b6b06275c4c0e98aae802de277f5f7f2&language=es-MX&page=1');

  Future<List<Results>?> getPopular() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        var movies = convert.jsonDecode(response.body)['results'] as List;
        List<Results> listMovies =
            movies.map((movie) => Results.fromMap(movie)).toList();
        return listMovies;
      } catch (e, r) {
        return null;
      }
    } else {
      return null;
    }
  }
}
