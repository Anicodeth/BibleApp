import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verse_event.dart';
part 'verse_state.dart';

class VerseBloc extends Bloc<VerseEvent, VerseState> {
  VerseBloc() : super(VerseInitial()) {
    on<VerseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
