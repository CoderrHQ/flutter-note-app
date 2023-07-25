import 'package:flutter/material.dart';
import 'package:note_app/Widgets/custom_button.dart';
import 'package:note_app/Widgets/round_button.dart';
import 'package:note_app/common/const.dart';
import 'package:note_app/note_repository/note_repository.dart';
import '../note_pages/home_page.dart';

class UpdateNoteScreen extends StatefulWidget {
  final noteId;
  static String id = 'update-note-page-screen';
  const UpdateNoteScreen({
    required this.noteId,
    super.key,
  });

  @override
  State<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends State<UpdateNoteScreen> {
  String title = 'No title';
  String description = 'No Description';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 8),
                  child: CustomButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    iconData: Icons.arrow_back_ios,
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
                  decoration:
                      kTextFieldStyle.copyWith(hintText: "Type something..."),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: RoundButton(
                  text: "EDIT",
                  onPressed: () {
                    NoteRepository().editNoteOnFirestore(
                      title: title,
                      description: description,
                      noteId: widget.noteId,
                    );
                    Navigator.pushNamed(context, MainHomePage.id);
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
