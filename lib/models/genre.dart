class Genre {
  final int? id;
  final String? name;
  String error;

  Genre({this.id, this.name, this.error = ''});

  factory Genre.fromJson(dynamic json) {
    if (json == null) {
      return Genre(error: 'Invalid data format');
    }
    return Genre(id: json['id'], name: json['name']);
  }
}
