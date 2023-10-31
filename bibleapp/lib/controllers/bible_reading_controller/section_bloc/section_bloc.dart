import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'section_event.dart';
part 'section_state.dart';

class SectionBloc extends Bloc<SectionEvent, SectionState> {
  SectionBloc() : super(SectionInitial()) {
    on<SectionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
