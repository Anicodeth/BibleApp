import 'package:bibleapp/controllers/note_screen_controller/bloc/note_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/note/note_card.dart';

class NoteNote extends StatelessWidget {
  
  const NoteNote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
      if (state.note.isEmpty) {
        return Center(
          child: Text("No Notes found!"),
        );
      }
      return ListView.builder(
        itemCount: state.note.length,
        itemBuilder: (context, index) => NoteCard(data: state.note[index]),
      );
    });
  }
}
