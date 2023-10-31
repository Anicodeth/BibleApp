import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';

import '../../../models/note/bookmark.dart';

part 'book_mark_event.dart';
part 'book_mark_state.dart';

class BookMarkBloc extends Bloc<BookMarkEvent, BookMarkState> {
  final Box<Bookmark> bookmarkBox;

  BookMarkBloc({required this.bookmarkBox})
      : super(
          BookMarkInitial(
            bookmarks: bookmarkBox.values.toList()
          ),
        ) {
    on<BookMarkEvent>((event, emit) async {
      
      if(event is AddBookmark){

        await bookmarkBox.add(event.note);
        List<Bookmark> notes = bookmarkBox.values.toList();

        emit(BookMarkInitial(bookmarks: notes));

      }

    });
  }
}
