import 'package:http/http.dart';
import 'dart:convert';

class MoviesService {
  Future<List> getMovies(int noOfMovies) async {
    List list = [];
    try {
      final apiKey = 'api_key=707414e69b0a5e6234ef7f10d3320a1e';
      for (int i = 0; i < noOfMovies; i++) {
        final uri = 'https://api.themoviedb.org/3/movie/$i?$apiKey';
        Response response = await get(Uri.parse(uri));
        if (response.statusCode == 200) {
          Map data = jsonDecode(response.body);
          list.add(data);
        } else
          noOfMovies = noOfMovies + 1;
      }
      return list;
    } catch (e) {
      return [];
    }
  }
}
