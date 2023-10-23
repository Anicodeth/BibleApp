import 'package:bibleapp/models/bible/bible.dart';
import 'package:bibleapp/widgets/chapter/chapters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views/bible_screen/bloc/bible_reading_bloc.dart';

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
            return Column(
              children: [
                TextButton(
                  onPressed: () {
                    BlocProvider.of<BibleReadingBloc>(context)
                        .add(ChaptersLoaded(bibles[index].chapters));
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
                Divider(
                  height: 10,
                )
              ],
            );
          },
        ));
  }
}
