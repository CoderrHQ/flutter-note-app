import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/note.dart';

class NoteRepository {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  displayNotes() {
    return _firestore
        .collection('Note')
        .where("userId", isEqualTo: _auth.currentUser!.uid)
        .snapshots();
  }

  addNoteToFirestore(description, title) async {
    final firestore = FirebaseFirestore.instance.collection("Note").doc();
    NoteModel noteModel = NoteModel(
        noteDate: DateTime.now(),
        noteDescription: description,
        noteId: firestore.id,
        noteTitle: title,
        userId: FirebaseAuth.instance.currentUser!.uid);

    await firestore.set(noteModel.toMap());
  }

  editNoteOnFirestore({
    required noteId,
    required title,
    required description,
  }) async {
    final collection = _firestore.collection('Note').doc(noteId);
    await collection.update({
      'noteTitle': title,
      'noteDescription': description,
    });
  }

  deleteNoteOnFirestore(noteId) async {
    await FirebaseFirestore.instance.collection('Note').doc(noteId).delete();
  }
}
