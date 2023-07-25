import 'package:flutter/material.dart';
import 'package:note_app/features/add_note/add_note_page.dart';
import 'package:note_app/features/note_pages/note_page.dart';
import 'package:note_app/welcome_page.dart';
import 'features/note_pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

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
      home: const WelcomePage(),
      routes: {
        AddNoteScreen.id: (context) => const AddNoteScreen(),
        NotePageScreen.id: (context) => const NotePageScreen(),
        MainHomePage.id: (context) => const MainHomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
