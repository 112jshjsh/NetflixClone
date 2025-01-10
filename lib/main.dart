import 'package:flutter/material.dart';
import 'package:netflix_clone/screen/home_screen.dart';
import 'package:netflix_clone/widget/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        hintColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const HomeScreen(),
              Container(
                child: const Center(
                  child: Text('search'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('saved'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('additional'),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const BottomBar(),
        ),
      ),
    );
  }
}
