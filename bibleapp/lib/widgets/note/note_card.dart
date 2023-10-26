import 'package:bibleapp/models/note/bookmark.dart';
import 'package:bibleapp/models/note/note.dart';
import 'package:flutter/material.dart';

import 'tag_card.dart';

class NoteCard extends StatelessWidget {
  final Note data;
  const NoteCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.title,
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TagCard(
                  tageName: data.tag,
                ),
                Text(data.date),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(data.note),
          ],
        ),
      ),
    );
  }
}
