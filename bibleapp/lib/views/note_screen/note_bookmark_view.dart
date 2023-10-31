import 'package:bibleapp/controllers/note_screen_controller/bloc/book_mark_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/note/bookmark_card.dart';

class NoteBookmark extends StatelessWidget {
  const NoteBookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookMarkBloc, BookMarkState>(builder: (context, state) {
      if (state.bookmarks.isEmpty) {
        return Center(
          child: Text("No bookmarks added!"),
        );
      }
      return ListView.builder(
        itemCount: state.bookmarks.length,
        itemBuilder: (context, index) => BookMarkCard(data: state.bookmarks[index]),
      );
    });
  }
}
