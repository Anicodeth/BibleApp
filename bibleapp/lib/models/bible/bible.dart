import 'package:bibleapp/models/chapter/chapter.dart';

class BibleModel {
  final String name;
  final List<ChapterModel> chapters;
  BibleModel({
    required this.name,
    required this.chapters,
  });

  factory BibleModel.fromJson(Map<String, dynamic> json) {
    return BibleModel(
      name: json['name'],
      chapters: json['chapters'],
    );
  }
}
