import 'package:bibleapp/controllers/note_screen_controller/bloc/note_bloc.dart';
import 'package:bibleapp/models/note/bookmark.dart';
import 'package:bibleapp/models/note/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'tag_card.dart';

class NoteCard extends StatelessWidget {
  final int idx;
  final Note data;
  const NoteCard({super.key, required this.data, required this.idx});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                Row(
                  children: [
                    Text(
                  formatDate(data.date),
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                
                ),


                PopupMenuButton<String>(
                  onSelected: (value) {

                    if (value == 'Remove') {

                      BlocProvider.of<NoteBloc>(context).add(
                        RemoveNote(data));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Successfully Deleted")));

                    } else if (value == 'Edit') {
                      
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        value: 'Remove',
                        child: Text('Remove'),
                      ),
                      PopupMenuItem(
                        value: 'Edit',
                        child: Text('Edit'),
                      ),
                    ];
                  },
                ),
                  ],
                )
                
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

  String formatDate(DateTime date) {
  final formatter = DateFormat('MMMM d, y');
  return formatter.format(date);
}
}
