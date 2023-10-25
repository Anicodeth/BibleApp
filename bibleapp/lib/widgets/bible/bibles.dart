import 'package:bibleapp/models/bible/bible.dart';
import 'package:bibleapp/widgets/chapter/chapters.dart';
import 'package:bibleapp/widgets/headers/bible_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/bible_reading_controller/bloc/bible_reading_bloc.dart';

class Bibles extends StatelessWidget {
  final List<BibleModel> bibles;
  const Bibles({super.key, required this.bibles});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BibleHeader(),
        Container(
            margin: const EdgeInsets.only(top: 60),
            child: ListView.builder(
              itemCount: bibles.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<BibleReadingBloc>(context).add(
                            ChaptersLoaded(
                                bibles[index].chapters, bibles[index].name));
                      },
                      child: ListTile(
                        minVerticalPadding: 20,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              bibles[index].name,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " ${bibles[index].chapters.length} Chapters",
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
            )),
      ],
    );
  }
}
