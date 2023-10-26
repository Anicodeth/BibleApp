import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/note/bookmark.dart';

part 'book_mark_event.dart';
part 'book_mark_state.dart';

class BookMarkBloc extends Bloc<BookMarkEvent, BookMarkState> {
  BookMarkBloc() : super(BookMarkInitial(bookmark: [Bookmark(title: "Jhon 1:1", tag: "NASB", note: "For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life.")])) {
    on<BookMarkEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
