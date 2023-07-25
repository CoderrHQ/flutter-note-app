import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/model/note.dart';
import '../features/note_pages/note_page.dart';
import '../note_repository/note_repository.dart';

class NoteTileWidget extends StatelessWidget {
  final Color colour;
  final NoteModel noteModel;

  const NoteTileWidget({
    super.key,
    required this.colour,
    required this.noteModel,
  });

  @override
  Widget build(BuildContext context) {
    final String timeSent =
        DateFormat('MMM dd, yyyy').format(noteModel.noteDate!.toDate());
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return NotePageScreen(
                noteModel: noteModel,
              );
            },
          ),
        );
      },
      onLongPress: () {
        NoteRepository().deleteNoteOnFirestore(noteModel.noteId);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
        child: Container(
          decoration: BoxDecoration(
            color: colour,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          padding: const EdgeInsets.only(
            top: 11,
            bottom: 8,
            left: 8,
            right: 8,
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  noteModel.noteTitle!,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 10,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 14),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    timeSent,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 13,
                    ),
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
