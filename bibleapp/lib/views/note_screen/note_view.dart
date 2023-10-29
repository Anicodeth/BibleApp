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
              Icons.bookmark,
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

          floatingActionButton: Container(
            decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: ()=>{
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: false,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView(
          
                        children: [
                          const Center(
                            child: Text(
                              "Make a new note",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomizeTextField(
                            textEditingController: verseEditingControler,
                            title: "Verse",
                            hintText: "Verse name...",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomizeTextField(
                            textEditingController: versionEditingControler,
                            title: "Version Non",
                            hintText: "Bible version...",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomizeTextField(
                            textEditingController: noteEditingControler,
                            title: "Note",
                            hintText: "Your note...",
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel"),
                                ),
                              ),
                              const Expanded(
                                flex: 4,
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex: 3,
                                child: ElevatedButton(
                                  onPressed: () {
          
                                    BlocProvider.of<NoteBloc>(context).add(
                                      AddNote(Note(
                                        title: verseEditingControler.text, 
                                        tag: versionEditingControler.text, 
                                        date: DateTime.timestamp(),
                                        note: noteEditingControler.text,
                                        ),),);
          
                                    // print(booksWidget.selectedBooks);
                                    // print(frequencyWidget.selected);
                                  },
                                  child: const Text("Done"),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )
              },
              ),
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
                        const Expanded(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: state.whichOne
                          ? const NoteBookmark()
                          : const NoteNote(),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
