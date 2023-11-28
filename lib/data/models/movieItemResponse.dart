import 'package:json_annotation/json_annotation.dart';
import 'package:movieflix/data/models/movieItemModel.dart';

part "movieItemResponse.g.dart";

@JsonSerializable()
class MovieItemResponse {
  @JsonKey(name: "dates")
  final Dates? dates;
  @JsonKey(name: "page")
  final int page;
  @JsonKey(name: "results")
  final List<MovieItemModel> results;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  MovieItemResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieItemResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieItemResponseToJson(this);
}

@JsonSerializable()
class Dates {
  @JsonKey(name: "maximum")
  final DateTime maximum;
  @JsonKey(name: "minimum")
  final DateTime minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);

  Map<String, dynamic> toJson() => _$DatesToJson(this);
}
