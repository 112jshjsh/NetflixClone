class Movie {
  final String title, keyword, poster;
  final bool isLiked;

  Movie.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        isLiked = map['isLiked'];

  @override
  String toString() => "Movie '$title': $keyword";
}
