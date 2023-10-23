import 'package:bibleapp/models/bible/bible.dart';
import 'package:bibleapp/widgets/chapter/chapters.dart';
import 'package:flutter/material.dart';

class Bibles extends StatelessWidget {
  final List<BibleModel> bibles;
  const Bibles({super.key, required this.bibles});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: bibles.length,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Chapters(chapters: bibles[index].chapters)));
              },
              child: Container(
                width: double.infinity,
                color: Color.fromARGB(255, 242, 242, 242),
                margin: EdgeInsets.only(top: 5, left: 4, right: 4),
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                child: Text(
                  bibles[index].name,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            );
          },
        ));
  }
}
