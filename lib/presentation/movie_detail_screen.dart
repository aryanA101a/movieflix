import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/constants.dart';
import 'package:movieflix/domain/entities/movieDetailsEntity.dart';
import 'package:movieflix/domain/entities/movieItemEntity.dart';
import 'package:movieflix/presentation/movie_detail_page_viewmodel.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen(this.initialMovieDetails, {super.key});
  final MovieItemEntity initialMovieDetails;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    context
        .read<MovieDetailPageViewModel>()
        .setInitialDetails(widget.initialMovieDetails);
    super.initState();
  }

  Widget build(BuildContext context) {
    var poster = TmdbApiUrls.posterUrl(
        "/${widget.initialMovieDetails.poster.split("/").last}",
        original: true);
    var movieDetails =
        context.select<MovieDetailPageViewModel, MovieDetailsEntity?>(
            (value) => value.movieDetails);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: CachedNetworkImageProvider(poster))),
        child: ListView(children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .7,
          ),
          if (movieDetails != null)
            MovieDetailWidget(movieDetails: movieDetails)
        ]),
      ),
    );
  }
}

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({
    super.key,
    required this.movieDetails,
  });

  final MovieDetailsEntity movieDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      // height: 300,
      decoration: const BoxDecoration(color: Colors.black87),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  movieDetails.title ?? "",
                  style: const TextStyle(
                      color: CupertinoColors.systemGrey4,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (movieDetails.userScore != null)
                Text(
                  "♛ ${(movieDetails.userScore! * 10).toInt()}%",
                  style: const TextStyle(
                    color: CupertinoColors.systemGrey2,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "${movieDetails.year ?? ""} ‧ ${movieDetails.genres.isNotEmpty ? movieDetails.genres.first : ""} ‧ ${movieDetails.runtime != null ? "${movieDetails.runtime! ~/ 60}h ${movieDetails.runtime! % 60}m" : ""} ",
            style: const TextStyle(color: CupertinoColors.systemGrey3),
          ),
          const SizedBox(
            height: 12,
          ),
          if (movieDetails.description != null)
            Text(
              movieDetails.description!,
              style: const TextStyle(
                  color: CupertinoColors.systemGrey2, fontSize: 15),
            ),
          const SizedBox(
            height: 12,
          ),
          if (movieDetails.budget != null)
            RichText(
              text: TextSpan(
                style: const TextStyle(
                    color: CupertinoColors.systemGrey2, fontSize: 16),
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Budget\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "\$${movieDetails.budget}",
                  ),
                ],
              ),
            ),
          const SizedBox(
            height: 6,
          ),
          if (movieDetails.revenue != null)
            RichText(
              text: TextSpan(
                style: const TextStyle(
                    color: CupertinoColors.systemGrey2, fontSize: 16),
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Revenue\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "\$${movieDetails.revenue}",
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
