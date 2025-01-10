import 'package:flutter/material.dart';
import 'package:netflix_clone/model/movie_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;
  const CarouselImage({super.key, required this.movies});

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  late List<Movie> movies;
  late List<String> keywords;
  late List<Widget> posters;
  late List<bool> isLiked;

  // ignore: prefer_final_fields
  int _currentPage = 0;
  late String _currentKeyword;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    keywords = movies.map((m) => m.keyword).toList();
    posters = movies.map((m) => Image.asset('./images/${m.poster}')).toList();
    isLiked = movies.map((m) => m.isLiked).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
        ),
        CarouselSlider(
          items: posters,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
                _currentKeyword = keywords[_currentPage];
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 3),
          child: Text(
            _currentKeyword,
            style: const TextStyle(fontSize: 11),
          ),
        ),
      ],
    );
  }
}
