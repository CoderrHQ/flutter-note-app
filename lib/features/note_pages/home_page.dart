import 'package:flutter/material.dart';

class MainHomePage extends StatelessWidget {
  static String id = 'main-home-page';
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      floatingActionButton: SizedBox(
        height: 80,
        width: 66.5,
        child: FloatingActionButton(
          backgroundColor: const Color(0xff3B3B3B),
          onPressed: () {},
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
    );
  }
}
