import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/Widgets/custom_button.dart';
import '../../common/const.dart';
import '../../model/note.dart';
import '../update_note/update_note_page.dart';

class NotePageScreen extends StatefulWidget {
  final NoteModel? noteModel;

  const NotePageScreen({super.key, this.noteModel});
  static String id = 'note-page-screen';

  @override
  State<NotePageScreen> createState() => _NotePageScreenState();
}

class _NotePageScreenState extends State<NotePageScreen> {
  @override
  Widget build(BuildContext context) {
    final String timeSent =
        DateFormat('MMM dd, yyyy').format(widget.noteModel!.noteDate!.toDate());
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      iconData: Icons.arrow_back_ios,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: CustomButton(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return UpdateNoteScreen(
                              noteId: widget.noteModel!.noteId,
                            );
                          }));
                        },
                        iconData: Icons.edit,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.noteModel!.noteTitle!,
                style: kBoldWhiteText.copyWith(
                  fontFamily: "fonts/Adrina-Regular.ttf",
                ),
              ),
              const SizedBox(height: 9),
              Row(
                children: [
                  Text(
                    timeSent,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                widget.noteModel!.noteDescription!,
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
    );
  }
}
