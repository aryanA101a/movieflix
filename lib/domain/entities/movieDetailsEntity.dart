class MovieDetailsEntity {
  MovieDetailsEntity({
    required this.id,
    this.title,
    this.description,
    this.poster,
    this.year,
    this.userScore,
    this.runtime,
    this.genres = const [],
    this.budget,
    this.revenue,
  });
  int id;
  String? title;
  String? description;
  String? poster;
  String? year;
  double? userScore;
  int? runtime;
  List<String> genres;
  int? budget;
  int? revenue;
}
