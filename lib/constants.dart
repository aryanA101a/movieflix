import 'dart:developer';

class TmdbApiUrls {
  static String movieItems(int pageKey, MovieItemType movieItemType) {
    log(movieItemType.value);
    return "https://api.themoviedb.org/3/movie/${movieItemType.value}?language=en-US&page=$pageKey";
  }

  static String movieDetails(int id) =>
      "https://api.themoviedb.org/3/movie/$id?language=en-US";
  static String posterUrl(String posterPath, {bool original = false}) =>
      "https://image.tmdb.org/t/p/${original ? "original" : "w342"}$posterPath";
}

enum MovieItemType {
  nowPlaying("now_playing"),
  topRated("top_rated");

  const MovieItemType(this.value);
  final String value;
}
