import 'package:bibleapp/controllers/note_screen_controller/bloc/note_bloc.dart';
import 'package:bibleapp/models/note/note.dart';
import 'package:bibleapp/widgets/plan/customize_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import '../../controllers/note_screen_controller/bloc/selector_book_or_note_bloc.dart';
import 'note_bookmark_view.dart';
import 'note_note_view.dart';

class NoteView extends StatelessWidget {
  
  final TextEditingController verseEditingControler = TextEditingController();
  final TextEditingController noteEditingControler = TextEditingController();
  final TextEditingController versionEditingControler = TextEditingController();

  NoteView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: const Icon(
              Icons.bookmark_outline,
              color: Colors.blue,
            ),
            title: const Text(
              "My Notes",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.white,
          ),

          body: BlocBuilder<SelectorBookOrNoteBloc, SelectorBookOrNoteState>(
            builder: (Context, state) {
              return NoteNote();
            },
          )),
    );
  }
}
