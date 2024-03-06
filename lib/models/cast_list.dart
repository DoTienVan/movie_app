class CastList {
  final List<Cast> cast;

  CastList(this.cast);

  factory CastList.fromJsonList(List<dynamic> jsonList) {
    List<Cast> castList = jsonList.map((json) => Cast.fromJson(json)).toList();
    return CastList(castList);
  }
}

class Cast {
  final String name;
  final String profilePath;
  final String character;

  Cast({
    required this.name,
    required this.profilePath,
    required this.character,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      name: json['name'] ?? '',
      profilePath: json['profile_path'] ?? '',
      character: json['character'] ?? '',
    );
  }
}
