import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:movieflix/constants.dart';
import 'package:movieflix/data/models/movieDetailsModel.dart';
import 'package:movieflix/data/models/movieItemModel.dart';
import 'package:movieflix/data/models/movieItemResponse.dart';

abstract class MovieRemoteDataSource {
  Future<MovieItemResponse> getNowPlayingMovies(
      int pageKey, MovieItemType movieItemType);
  Future<MovieDetailsModel> getMovieDetails(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final Client client;
  MovieRemoteDataSourceImpl({required this.client});

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async{
    var headers = {
      "Authorization": "Bearer ${dotenv.get("TMDB_ACCESS_TOKEN")}",
      "accept": "application/json",
    };
    final response = await client
        .get(Uri.parse(TmdbApiUrls.movieDetails(id)), headers: headers);
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(json.decode(response.body));
    } else {
      log(response.body.toString());
      throw Exception("Something went wrong");
    }
  }

  @override
  Future<MovieItemResponse> getNowPlayingMovies(
      int pageKey, MovieItemType movieItemType) async {
    var headers = {
      "Authorization": "Bearer ${dotenv.get("TMDB_ACCESS_TOKEN")}",
      "accept": "application/json",
    };
    final response = await client
        .get(Uri.parse(TmdbApiUrls.movieItems(pageKey,movieItemType)), headers: headers);
    if (response.statusCode == 200) {
      return MovieItemResponse.fromJson(json.decode(response.body));
    } else {
      log(response.body.toString());
      throw Exception("Something went wrong");
    }
  }
}
