import 'package:bibleapp/models/chapter/chapter.dart';
import 'package:bibleapp/widgets/headers/chapter_header.dart';
import 'package:bibleapp/widgets/verse/verses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/bible_reading_controller/bloc/bible_reading_bloc.dart';

class Chapters extends StatelessWidget {
  final List<ChapterModel> chapters;
  final String selectedBible;
  const Chapters(
      {super.key, required this.chapters, required this.selectedBible});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ChapterHeader(
          selectedBible: selectedBible,
        ),
        Container(
          margin: const EdgeInsets.only(top: 60),
          child: ListView.builder(
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<BibleReadingBloc>(context).add(
                          VersesLoaded(chapters[index].verses, selectedBible,
                              chapters[index].name, chapters));
                    },
                    child: ListTile(
                      minVerticalPadding: 20,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            chapters[index].name,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " ${chapters[index].verses.length} Verses",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 10,
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
