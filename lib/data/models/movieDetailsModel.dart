import 'package:fpdart/fpdart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movieflix/domain/entities/movieDetailsEntity.dart';

part 'movieDetailsModel.g.dart';

@JsonSerializable()
class MovieDetailsModel {
  @JsonKey(name: "adult")
  final bool? adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "belongs_to_collection")
  final dynamic belongsToCollection;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "genres")
  final List<Genre>? genres;
  @JsonKey(name: "homepage")
  final String? homepage;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "imdb_id")
  final String? imdbId;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "popularity")
  final double? popularity;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "production_companies")
  final List<ProductionCompany>? productionCompanies;
  @JsonKey(name: "production_countries")
  final List<ProductionCountry>? productionCountries;
  @JsonKey(name: "release_date")
  final DateTime? releaseDate;
  @JsonKey(name: "revenue")
  final int? revenue;
  @JsonKey(name: "runtime")
  final int? runtime;
  @JsonKey(name: "spoken_languages")
  final List<SpokenLanguage>? spokenLanguages;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "tagline")
  final String? tagline;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "video")
  final bool? video;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;

  MovieDetailsModel({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);

  MovieDetailsEntity toEntity() => MovieDetailsEntity(
        id: id,
        title: title ?? originalTitle,
        description: overview,
        poster: posterPath,
        year: releaseDate?.year.toString(),
        userScore: voteAverage,
        runtime: runtime,
        genres:
            genres?.where((t) => t.name != null).map((e) => e.name!).toList() ??
                [],
        budget: budget,
        revenue: revenue,
      );
}

@JsonSerializable()
class Genre {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class ProductionCompany {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "logo_path")
  final String? logoPath;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "origin_country")
  final String? originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable()
class ProductionCountry {
  @JsonKey(name: "iso_3166_1")
  final String? iso31661;
  @JsonKey(name: "name")
  final String? name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable()
class SpokenLanguage {
  @JsonKey(name: "english_name")
  final String? englishName;
  @JsonKey(name: "iso_639_1")
  final String? iso6391;
  @JsonKey(name: "name")
  final String? name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
