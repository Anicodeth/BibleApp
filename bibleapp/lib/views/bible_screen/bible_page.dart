import 'package:bibleapp/models/bible/bible.dart';
import 'package:bibleapp/widgets/bible/bibles.dart';
import 'package:flutter/material.dart';

class BiblePage extends StatelessWidget {
  BiblePage({super.key});
  List<BibleModel> bibles = [
    BibleModel(name: "Exodus", chapters: []),
    BibleModel(name: "Genesis", chapters: []),
    BibleModel(name: "Leviticus", chapters: []),
    BibleModel(name: "Numbers", chapters: []),
    BibleModel(name: "Deuteronomy", chapters: []),
    BibleModel(name: "Joshua", chapters: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
              child: const Text(
            "Bible",
            style: TextStyle(color: Colors.black),
          )),
        ),
        body: Bibles(
          bibles: bibles,
        ));
  }
}
