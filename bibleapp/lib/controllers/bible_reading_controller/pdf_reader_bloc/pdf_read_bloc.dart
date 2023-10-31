import 'dart:io';
import 'package:bibleapp/models/bible/biblehive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'package:dio/dio.dart';

part 'pdf_read_event.dart';
part 'pdf_read_state.dart';

class PdfReadBloc extends Bloc<PdfReadEvent, PdfReadState> {
  final _dio = Dio();
  final Box<BibleModel> bibleBox;
  PdfReadBloc({required this.bibleBox}) : super(PdfLoading()) {
    on<PdfReadEvent>((event, emit) async {
      emit(PdfLoading());
      late String? path;
      if (event is ReadPdf){
        BibleModel? bible = bibleBox.get(event.name);
        if (bible != null){
          path = bible.path;
          File file = File(path);
          if (await file.exists()){
            emit(PdfLoaded(path: path));
          }else{

            final response = await _dio.get(event.link, options: Options(responseType: ResponseType.bytes));

            final directory = await getApplicationDocumentsDirectory();
            final filePath = '${directory.path + event.name + DateTime.now().toString()}.pdf';
            File pdfFile = File(filePath);
            await pdfFile.writeAsBytes(response.data, flush: true);
            await bibleBox.put(event.name,BibleModel(name: event.name, path: filePath));
            emit(PdfLoaded(path: filePath));
          }

        }else{
          final response = await _dio.get(event.link, options: Options(responseType: ResponseType.bytes));

          final directory = await getApplicationDocumentsDirectory();
          final filePath = '${directory.path + event.name + DateTime.now().toString()}.pdf';
          File pdfFile = File(filePath);
          await pdfFile.writeAsBytes(response.data, flush: true);
          await bibleBox.put(event.name,BibleModel(name: event.name, path: filePath));
          emit(PdfLoaded(path: filePath));
        }
      }

    });
  }


}
