import 'package:bibleapp/models/chapter/chapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/bible_reading_controller/bloc/bible_reading_bloc.dart';

class VerseHeader extends StatelessWidget {
  final List<ChapterModel> chapters;
  final String selectedBible;
  final String selectedChapter;
  const VerseHeader(
      {super.key,
      required this.chapters,
      required this.selectedBible,
      required this.selectedChapter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 245, 242, 242)),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  BlocProvider.of<BibleReadingBloc>(context)
                      .add(ChaptersLoaded(chapters, selectedBible));
                },
                child: Text(
                  selectedChapter,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Text(
                    selectedBible,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_drop_down))
                ],
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
