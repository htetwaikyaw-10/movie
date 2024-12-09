import 'dart:convert';

import 'package:flutter_movie_application/app/data/color_consts.dart';
import 'package:flutter_movie_application/app/data/movie_model.dart';
import 'package:flutter_movie_application/app/data/popular_movie_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SeeAllController extends GetxController {
  //TODO: Implement SeeAllController

  final count = 0.obs;
  var popularmovieList = <PopularMovie>[].obs;
  var recommendedMovies = <MovieModel>[
    MovieModel("Welcome to the jungle", "Action", "assets/j.jpg", 4.3),
    MovieModel("Life of Pi", "Story", "assets/lop.jpg", 4.4),
    MovieModel("Spider-Man", "Action", "assets/sp.jpg", 4.6),
    MovieModel("Docter Stranger", "Danary", "assets/human.jpg", 4.5),
    MovieModel("Avangers: End Games", "Action", "assets/j.jpg", 4.5),
    MovieModel("F9", "Action", "assets/lop.jpg", 4.5),
  ].obs;
  @override
  void onInit() {
    super.onInit();
    fetchPopularMovies();
  }
  Future<void> fetchPopularMovies() async {
    final url = '$baseUrl/movie/popular?api_key=19d6149f34738ec93c495cd0527246ae&language=en-US&page=1';

    try {
      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        
        if (jsonData['results'] is List) {
          popularmovieList.value = (jsonData['results'] as List)
              .map((data) => PopularMovie.fromJson(data))
              .toList();
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
