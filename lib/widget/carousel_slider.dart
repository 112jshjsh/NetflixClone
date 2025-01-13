import 'package:flutter/material.dart';
import 'package:netflix_clone/model/movie_model.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:netflix_clone/screen/detail_screen.dart';

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
        Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 3),
          child: Text(
            _currentKeyword,
            style: const TextStyle(fontSize: 11),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // 내가 찜한 컨텐츠
            Column(
              children: [
                isLiked[_currentPage]
                    ? IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {},
                      )
                    : IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {},
                      ),
                const Text(
                  "내가 찜한 컨텐츠",
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),

            // 재생
            Container(
              padding: const EdgeInsets.only(right: 30),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(Icons.play_arrow, color: Colors.black),
                    Padding(padding: EdgeInsets.all(3)),
                    Text(
                      '재생',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            // 정보
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.info),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (BuildContext context) {
                            return DetailScreen(movie: movies[_currentPage]);
                          }));
                    },
                  ),
                  const Text(
                    "정보",
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: makeIndicator(isLiked, _currentPage),
        )
      ],
    );
  }
}

List<Widget> makeIndicator(List list, int currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == i
              ? const Color.fromRGBO(255, 255, 255, 0.9)
              : const Color.fromRGBO(255, 255, 255, 0.4)),
    ));
  }

  return results;
}
