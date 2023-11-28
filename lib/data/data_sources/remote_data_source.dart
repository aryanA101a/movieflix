import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:movieflix/constants.dart';
import 'package:movieflix/data/models/movieItemModel.dart';
import 'package:movieflix/data/models/movieItemResponse.dart';

abstract class MovieRemoteDataSource {
  Future<MovieItemResponse> getNowPlayingMovies(int pageKey);
  Future<List<MovieItemModel>> getTopRatedMovies();
  // Future<MovieDetailsModel> getMovieDetails();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final Client client;
  MovieRemoteDataSourceImpl({required this.client});

//   @override
//   Future<MovieDetailsModel> getMovieDetails() {
// final response=client.get(url)
//   }

  @override
  Future<MovieItemResponse> getNowPlayingMovies(int pageKey) async {
    var headers = {
      "Authorization": "Bearer ${dotenv.get("TMDB_ACCESS_TOKEN")}",
      "accept": "application/json",
    };
    final response =
        await client.get(Uri.parse(TmdbApiUrls.nowPlaying(pageKey)), headers: headers);
    if (response.statusCode == 200) {
      return MovieItemResponse.fromJson(json.decode(response.body));
    } else {
      log(response.body.toString());
      throw Exception("Something went wrong");
    }
  }

  @override
  Future<List<MovieItemModel>> getTopRatedMovies() {
    throw UnimplementedError();
  }
}
