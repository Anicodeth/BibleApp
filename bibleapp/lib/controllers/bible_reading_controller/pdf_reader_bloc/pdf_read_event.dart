part of 'pdf_read_bloc.dart';

@immutable
sealed class PdfReadEvent {}

class ReadPdf extends PdfReadEvent{
  final String name;
  final String link;

  ReadPdf({required this.name, required this.link});

}