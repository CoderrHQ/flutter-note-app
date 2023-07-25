// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import '../../common/const.dart';

class NotePageScreen extends StatelessWidget {
  const NotePageScreen({super.key});
  static String id = 'note-page-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Note Title",
                  style: kBoldWhiteText.copyWith(
                    fontFamily: "fonts/Adrina-Regular.ttf",
                  ),
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    Text(
                      "24 Jul, 2023",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Text(
                  "Note Description",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    // fontFamily: "fonts/Roboto-ThinItalic.ttf",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
