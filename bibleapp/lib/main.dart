import 'package:bibleapp/controllers/note_screen_controller/bloc/note_bloc.dart';
import 'package:bibleapp/controllers/note_screen_controller/bloc/selector_book_or_note_bloc.dart';
import 'package:bibleapp/controllers/plan_screen_controller/bloc/plan_bloc.dart';
import 'package:bibleapp/models/note/note.dart';
import 'package:bibleapp/models/plan/plan.dart';
import 'package:bibleapp/views/bible_screen/bible_page.dart';
import 'package:bibleapp/views/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'controllers/bible_reading_controller/bloc/bible_reading_bloc.dart';
import 'controllers/note_screen_controller/bloc/book_mark_bloc.dart';

void main() async{

  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(PlanAdapter());
  Box<Note> notes = await Hive.openBox<Note>('notes');
  Box<Plan> plans = await Hive.openBox<Plan>('plans');

  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => ProviderScope(
    //     child: MultiBlocProvider(
    //       providers: [
    //         BlocProvider<BibleReadingBloc>(
    //           create: (context) => BibleReadingBloc(),
    //         ),
    //         BlocProvider<SelectorBookOrNoteBloc>(
    //           create: (context) => SelectorBookOrNoteBloc(),
    //         ),
    //         BlocProvider<BookMarkBloc>(
    //           create: (context) => BookMarkBloc(),
    //         ),
    //         BlocProvider<NoteBloc>(
    //           create: (context) => NoteBloc(),
    //         ),
    //       ],
    //       child: const MaterialApp(
    //         home: HomePage(),
    //       ),
    //     ),
    //   ),
    // ),


    MultiBlocProvider(
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
              create: (context) => NoteBloc(noteBox: notes),
            ),
            BlocProvider<PlanBloc>(
              create: (context) => PlanBloc(planBox: plans),
            ),
          ],
          child: const MaterialApp(
            home: HomePage(),
          ),
        ),
  );
}
