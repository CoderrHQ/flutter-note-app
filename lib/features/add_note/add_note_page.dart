import 'package:flutter/material.dart';
import 'package:note_app/Widgets/round_button.dart';
import 'package:note_app/note_repository/note_repository.dart';

import '../../common/const.dart';

class AddNoteScreen extends StatefulWidget {
  static String id = 'add-note-page-screen';
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  String title = 'No title';
  String description = 'No Description';
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
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25, left: 3),
                  child: Container(
                    height: 40,
                    width: 42,
                    decoration: kContainerBoxDecoration,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                onChanged: (newValue) {
                  title = newValue;
                },
                decoration: kTextFieldStyle,
              ),
              const SizedBox(height: 12),
              Flexible(
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  onChanged: (newValue) {
                    description = newValue;
                  },
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
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: RoundButton(
                  text: "SAVE",
                  onPressed: () {
                    NoteRepository().addNoteToFirestore(description, title);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
