class TmdbApiUrls {
  static const nowPlaying =
      "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1";
  static const topRated =
      "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1";
  static const movieDetails =
      "https://api.themoviedb.org/3/movie/movie_id?language=en-US";
  static String posterUrl(String posterPath, {bool original = false}) =>
      "https://image.tmdb.org/t/p/${original ? "original" : "w342"}$posterPath";
}
