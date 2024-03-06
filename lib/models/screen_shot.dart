import 'package:equatable/equatable.dart';

class Screenshot extends Equatable {
  final double? aspect;
  final String? imagePath;
  final int? height;
  final int? width;
  final String? countryCode;
  final double? voteAverage;
  final int? voteCount;

  Screenshot({
    this.aspect,
    this.imagePath,
    this.height,
    this.width,
    this.countryCode,
    this.voteAverage,
    this.voteCount,
  });

  factory Screenshot.fromJson(Map<String, dynamic>? json) {
    return Screenshot(
      aspect: (json?['aspect_ratio'] as double?) ?? 1.0,
      imagePath: json?['file_path'] as String? ?? '',
      height: json?['height'] as int? ?? 0,
      width: json?['width'] as int? ?? 0,
      countryCode: json?['iso_639_1'] as String? ?? '',
      voteAverage: (json?['vote_average'] as double?) ?? 0.0,
      voteCount: json?['vote_count'] as int? ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        aspect,
        imagePath,
        height,
        width,
        countryCode,
        voteAverage,
        voteCount,
      ];

  @override
  bool get stringify => true; // Cho phép sử dụng Equatable với String
}
