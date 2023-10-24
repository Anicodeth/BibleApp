import 'package:bibleapp/models/bible/bible.dart';
import 'package:bibleapp/models/chapter/chapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/bible_reading_controller/bloc/bible_reading_bloc.dart';

class ChapterHeader extends StatelessWidget {
  final String selectedBible;
  const ChapterHeader({super.key, required this.selectedBible});

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
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 245, 242, 242)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                      onPressed: () {
                        BlocProvider.of<BibleReadingBloc>(context)
                            .add(BiblesLoaded());
                      },
                      child: Text(
                        selectedBible,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
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
