import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // profile image
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('images/bbongflix_logo.png'),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: const Text(
              'Suhyeon',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            width: 140,
            height: 5,
            color: Colors.red,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Linkify(
              onOpen: (link) async {
                if (await canLaunchUrlString(link.url)) {
                  await launchUrlString(link.url);
                }
              },
              text: "https://github.com/112jshjsh",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 7,
              horizontal: 20,
            ),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '프로필 수정하기',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
