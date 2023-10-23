import 'package:bibleapp/views/bible_screen/bible_page.dart';
import 'package:bibleapp/views/bible_screen/bloc/bible_reading_bloc.dart';
import 'package:bibleapp/views/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => ProviderScope(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BibleReadingBloc>(
                create: (context) => BibleReadingBloc()),
          ],
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      ),
    ),
  );
}
