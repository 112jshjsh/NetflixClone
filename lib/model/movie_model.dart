import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String title, keyword, poster;
  final bool isLiked;
  final DocumentReference reference;

  Movie.fromMap(Map<String, dynamic> map, {required this.reference})
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        isLiked = map['like'];

  Movie.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() => "Movie '$title': $keyword";
}
