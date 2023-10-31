import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:bibleapp/controllers/bible_reading_controller/pdf_reader_bloc/pdf_read_bloc.dart';
import 'package:bibleapp/controllers/note_screen_controller/bloc/book_mark_bloc.dart';
import 'package:bibleapp/controllers/note_screen_controller/bloc/note_bloc.dart';
import 'package:bibleapp/models/note/bookmark.dart';
import 'package:bibleapp/models/note/note.dart';
import 'package:bibleapp/widgets/plan/customize_text_field.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({
    this.pdfName,
    super.key,
  });
  final pdfName;
  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  @override
  void initState() {
    super.initState();

    // Add your initialization logic here
    // For example, you can fetch data, set initial state, or perform any setup.
    // This code will run when the screen is first created.
  }

  String? selectedText;
  PdfViewerController _pdfViewerController = PdfViewerController();
  final TextEditingController verseEditingControler = TextEditingController();
  final TextEditingController noteEditingControler = TextEditingController();
  final TextEditingController versionEditingControler = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.white,
          elevation: 1,
          title: Text(
            widget.pdfName,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.black, letterSpacing: 2, fontSize: 20),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.copy, color: Colors.black,),
              onPressed: () {

                if (selectedText != null){
                  Clipboard.setData(ClipboardData(text: selectedText!));
                  _pdfViewerController.clearSelection();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Copied to clipboard")));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Please select a text")));
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.bookmark_outline, color: Colors.black,),
              onPressed: () {
                if (selectedText != null){
                  _showBottomSheetBookmark(context);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Please select a text")));
                }
                
                
              },
            ),
            IconButton(
              icon: Icon(Icons.note_add_outlined, color: Colors.black,),
              onPressed: () {
                // Implement note action here
                _showBottomSheetNote(context);
              },
            ),
          ]
        ),
        body: BlocBuilder<PdfReadBloc, PdfReadState>(
      builder: (context, state) {
        if (state is PdfLoading){
           return const Center(child: CircularProgressIndicator());
        }else if(state is PdfLoaded){
          return SfPdfViewer.file(
                  File(state.path),
                  onTextSelectionChanged:
                  (PdfTextSelectionChangedDetails details) {
                      if (details.selectedText != null) {
                        selectedText = details.selectedText;
                      }else{
                        selectedText = null;
                      }
                    },
                  controller: _pdfViewerController,
                  
                );
        }else{
          return const Center(child: Text("Error On Loading PDF"));
        }
      },
    ));
        
        
  }


  void _showBottomSheetNote(BuildContext context){
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
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Bookmarked")));
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
      );
  }

  void _showBottomSheetBookmark(BuildContext context){
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
                    "Bookmark",
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
                          BlocProvider.of<BookMarkBloc>(context).add(
                            AddBookmark(Bookmark(
                              title: verseEditingControler.text,
                              tag: versionEditingControler.text,
                              text: selectedText!
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
      );
  }

}