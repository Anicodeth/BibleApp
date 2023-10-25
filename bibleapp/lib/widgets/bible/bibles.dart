import 'package:bibleapp/models/bible/bible.dart';
import 'package:bibleapp/widgets/chapter/chapters.dart';
<<<<<<< HEAD
import 'package:flutter/material.dart';
=======
import 'package:bibleapp/widgets/headers/bible_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/bible_reading_controller/bloc/bible_reading_bloc.dart';
>>>>>>> origin/shamil

class Bibles extends StatelessWidget {
  final List<BibleModel> bibles;
  const Bibles({super.key, required this.bibles});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    return Stack(
      children: [
        BibleHeader(),
        Container(
            margin: EdgeInsets.only(top: 60),
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
                    Divider(
                      height: 10,
                    )
                  ],
                );
              },
            )),
      ],
    );
>>>>>>> origin/shamil
  }
}
