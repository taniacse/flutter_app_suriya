import 'dart:async';
import 'package:flutter_app_suriya/models/trailer_model.dart';

import 'movie_api_provider.dart';
import '../models/items_model.dart';



class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<TrailerModel> fetchTrailers(int movieId) =>
      moviesApiProvider.fetchTrailer(movieId);
}
