import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import '../../controllers/note_screen_controller/bloc/selector_book_or_note_bloc.dart';
import 'note_bookmark_view.dart';
import 'note_note_view.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.bookmark,
              color: Colors.blue,
            ),
            title: Text(
              "My Notes",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
          ),
          body: BlocBuilder<SelectorBookOrNoteBloc, SelectorBookOrNoteState>(
            builder: (Context, state) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<SelectorBookOrNoteBloc>(context)
                                    .add(SelectBookmarkEvent());
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        state.whichOne
                                            ? Colors.blue
                                            : Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        !state.whichOne
                                            ? Colors.blue
                                            : Colors.white),
                              ),
                              child: const Text("Bookmarks"),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 4,
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<SelectorBookOrNoteBloc>(context)
                                    .add(SelectNoteEvent());
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        !state.whichOne
                                            ? Colors.blue
                                            : Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        state.whichOne
                                            ? Colors.blue
                                            : Colors.white),
                              ),
                              child: const Text("Notes"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: state.whichOne
                          ? NoteBookmark()
                          : NoteNote(),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
