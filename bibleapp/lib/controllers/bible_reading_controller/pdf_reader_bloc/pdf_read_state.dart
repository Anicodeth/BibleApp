part of 'pdf_read_bloc.dart';

@immutable
sealed class PdfReadState {}

final class PdfReadInitial extends PdfReadState {}

class PdfLoading extends PdfReadState {
}

class PdfLoaded extends PdfReadState{
  final String path;

  PdfLoaded({required this.path});
}
