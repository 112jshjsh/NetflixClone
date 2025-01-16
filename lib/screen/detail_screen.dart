import 'package:flutter/material.dart';
import 'package:netflix_clone/model/movie_model.dart';
import 'dart:ui';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  const DetailScreen({super.key, required this.movie});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isLiked = false;
  @override
  void initState() {
    super.initState();
    isLiked = widget.movie.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.movie.poster),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.black.withOpacity(0.1),
                        child: Column(
                          children: [
                            // poster
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 45, bottom: 10),
                              child: Image.network(
                                widget.movie.poster,
                                height: 300,
                              ),
                            ),
                            // description
                            const Padding(
                              padding: EdgeInsets.all(7),
                              child: Text(
                                '99% 일치 2019 15+ 시즌 1개',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                            // movie title
                            Padding(
                              padding: const EdgeInsets.fromLTRB(7, 0, 7, 7),
                              child: Text(
                                widget.movie.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // play button
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 3,
                                horizontal: 12,
                              ),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '재생',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // description 2
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 7,
                                horizontal: 12,
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.movie.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            // actors & producers
                            Container(
                              padding: const EdgeInsets.fromLTRB(12, 3, 12, 7),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "출연: 현빈, 손예진, 서지혜\n제작자: 이정효, 박지은",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // appbar
                Positioned(
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // isLiked
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                          widget.movie.reference.update({'like': isLiked});
                        });
                      },
                      child: Column(
                        children: [
                          isLiked
                              ? const Icon(Icons.check)
                              : const Icon(Icons.add),
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              '내가 찜한 콘텐츠',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white60,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // score
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: const Column(
                      children: [
                        Icon(Icons.thumb_up),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          '평가',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white60,
                          ),
                        )
                      ],
                    ),
                  ),
                  // share
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: const Column(
                      children: [
                        Icon(Icons.send),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          '공유',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white60,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
