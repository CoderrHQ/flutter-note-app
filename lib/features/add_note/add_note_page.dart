// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../common/const.dart';

class AddNoteScreen extends StatelessWidget {
  static String id = 'add-note-page-screen';
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: kTextFieldStyle,
              ),
              const SizedBox(height: 12),
              Flexible(
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  maxLines: 10,
                  decoration: kTextFieldStyle.copyWith(
                    hintText: "Type something...",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff9A9A9A),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
