import 'package:bibleapp/models/bible/bible.dart';
import 'package:bibleapp/widgets/chapter/chapters.dart';
import 'package:bibleapp/widgets/headers/bible_header.dart';
import 'package:bibleapp/widgets/headers/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/bible_reading_controller/bloc/bible_reading_bloc.dart';
import 'package:bibleapp/models/section/section.dart';

class SectionList extends StatelessWidget {
  final String bibleName;
  final List<SectionModel> sections;
  const SectionList({super.key, required this.sections, required this.bibleName});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SectionHeader(bibleName: bibleName),
        Container(
            margin: const EdgeInsets.only(top: 60),
            child: ListView.builder(
              itemCount: sections.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        // BlocProvider.of<BibleReadingBloc>(context).add(
                        //     SectionsLoaded(
                        //         bibles[index].sections, bibles[index].name));
                      },
                      child: ListTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        tileColor: const Color.fromARGB(255, 157, 202, 240),
                        minVerticalPadding: 20,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              sections[index].name,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 4,
                    )
                  ],
                );
              },
            )),
      ],
    );
  }
}