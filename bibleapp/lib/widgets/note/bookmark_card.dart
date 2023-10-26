import 'package:bibleapp/models/note/bookmark.dart';
import 'package:flutter/material.dart';

import 'tag_card.dart';

class BookMarkCard extends StatelessWidget {
  final Bookmark data;
  const BookMarkCard({super.key, required this.data});

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
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TagCard(tageName: data.tag,),
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
