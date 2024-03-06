import 'package:equatable/equatable.dart';
import 'package:movies_app/models/screen_shot.dart';

class MovieImage extends Equatable {
  final List<Screenshot> backdrops;
  final List<Screenshot> posters;

  const MovieImage({required this.backdrops, required this.posters});

  factory MovieImage.fromJson(Map<String, dynamic>? result) {
    if (result == null) {
      return MovieImage(backdrops: [], posters: []);
    }

    return MovieImage(
      backdrops: (result['backdrops'] as List<dynamic>?)
              ?.map((b) => Screenshot.fromJson(b as Map<String, dynamic>))
              ?.toList() ??
          [],
      posters: (result['posters'] as List<dynamic>?)
              ?.map((b) => Screenshot.fromJson(b as Map<String, dynamic>))
              ?.toList() ??
          [],
    );
  }

  @override
  List<Object?> get props => [backdrops, posters];
}
