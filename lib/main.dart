import 'package:flutter/material.dart';
import 'package:note_app/features/add_note/add_note_page.dart';
import 'package:note_app/features/note_pages/note_page.dart';
import 'package:note_app/welcome_page.dart';
import 'package:note_app/features/update_note/update_note_page.dart';
import 'features/note_pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const WelcomePage();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return const MainHomePage();
          }
          return const MainHomePage();
        },
      ),
      routes: {
        UpdateNoteScreen.id: (context) => const UpdateNoteScreen(noteId: ''),
        AddNoteScreen.id: (context) => const AddNoteScreen(),
        NotePageScreen.id: (context) => const NotePageScreen(),
        MainHomePage.id: (context) => const MainHomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
