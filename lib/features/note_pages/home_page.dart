import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app/common/colors.dart';
import 'package:note_app/note_repository/note_repository.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/features/add_note/add_note_page.dart';
import '../../Widgets/note_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MainHomePage extends StatefulWidget {
  static String id = 'main-home-page';
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final MyColors myColors = MyColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      floatingActionButton: SizedBox(
        height: 80,
        width: 66.5,
        child: FloatingActionButton(
          backgroundColor: const Color(0xff3B3B3B),
          onPressed: () {
            Navigator.pushNamed(context, AddNoteScreen.id);
          },
          child: const Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff252525),
        title: const Padding(
          padding: EdgeInsets.only(top: 27),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  "NOTEONE",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 26, left: 6, right: 6),
        child: StreamBuilder<QuerySnapshot>(
          stream: NoteRepository().displayNotes(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return MasonryGridView.count(
              itemCount: snapshot.data!.docs.length,
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                final note = snapshot.data!.docs[index];
                NoteModel noteModel =
                    NoteModel.fromMap(note.data()! as Map<String, dynamic>);
                return NoteTileWidget(
                  noteModel: noteModel,
                  colour: myColors.colors[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
