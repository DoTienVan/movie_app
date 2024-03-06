import 'package:movies_app/models/cast_list.dart';
import 'package:movies_app/models/movie_image.dart';

class MovieDetail {
  final int id;
  final String title;
  final String backdropPath;
  final String budget;
  final String originalTitle;
  final String overview;
  final String releaseDate;
  final String runtime;
  final double voteAverage;
  final String voteCount;

  String trailerId;

  MovieImage movieImage;

  List<Cast> castList;

  MovieDetail({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.budget,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.voteCount,
    this.trailerId = '',
    required this.movieImage,
    required this.castList,
  });

  factory MovieDetail.fromJson(dynamic json) {
    if (json == null) {
      throw ArgumentError("Input map cannot be null");
    }

    return MovieDetail(
      id: json['id'],
      title: json['title'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      budget: json['budget']?.toString() ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      releaseDate: json['release_date'] ?? '',
      runtime: json['runtime']?.toString() ?? '',
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      voteCount: json['vote_count']?.toString() ?? '',
      trailerId: '', // Thêm giá trị mặc định cho trailerId
      movieImage: MovieImage.fromJson(json['posters'] ?? {}),
      castList: CastList.fromJsonList(json['cast_list'] ?? [])
          .cast, // Sử dụng 'fromJsonList' để chuyển đổi thành danh sách Cast
    );
  }
}
