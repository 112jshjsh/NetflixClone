import 'package:flutter/material.dart';
import 'package:netflix_clone/model/movie_model.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;
  const BoxSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('지금 뜨는 콘텐츠'),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(movies),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages(List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(right: 15),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset('images/${movies[i].poster}'),
        ),
      ),
    ));
  }
  return results;
}
