import 'package:bibleapp/models/chapter/chapter.dart';
import 'package:flutter/material.dart';

class Chapters extends StatelessWidget {
  final List<ChapterModel> chapters;
  const Chapters({super.key, required this.chapters});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chapters.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(chapters[index].name),
        );
      },
    );
  }
}
