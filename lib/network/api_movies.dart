import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:practica2/models/popularDAO.dart';

class ApiMovies {
  var url = Uri.https("api.themoviedb.org",
      "/3/movie/550?api_key=b6b06275c4c0e98aae802de277f5f7f2");

  Future<List<Results>?> getPopular() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var movies = convert.jsonDecode(jsonResponse['results']);
      List<Results> listMovies =
          movies.map((movie) => Results.fromMap(movie)).toList();
      return listMovies;
    } else {
      return null;
    }
  }
}
