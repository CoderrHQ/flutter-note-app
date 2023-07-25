import 'package:flutter/material.dart';

class NoNoteWidget extends StatelessWidget {
  const NoNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'NO NOTE',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.white,
              height: 200,
              width: 350,
              child: Image.asset('images/noNote.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
