import 'package:bibleapp/controllers/note_screen_controller/bloc/note_bloc.dart';
import 'package:bibleapp/controllers/note_screen_controller/bloc/selector_book_or_note_bloc.dart';
import 'package:bibleapp/views/bible_screen/bible_page.dart';
import 'package:bibleapp/views/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_preview/device_preview.dart';

import 'controllers/bible_reading_controller/bloc/bible_reading_bloc.dart';
import 'controllers/note_screen_controller/bloc/book_mark_bloc.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => ProviderScope(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BibleReadingBloc>(
              create: (context) => BibleReadingBloc(),
            ),
            BlocProvider<SelectorBookOrNoteBloc>(
              create: (context) => SelectorBookOrNoteBloc(),
            ),
            BlocProvider<BookMarkBloc>(
              create: (context) => BookMarkBloc(),
            ),
            BlocProvider<NoteBloc>(
              create: (context) => NoteBloc(),
            ),
          ],
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      ),
    ),
  );
}
