import 'package:bibleapp/models/chapter/chapter.dart';

class SectionModel {
  final String name;
  final int chapters;
  final String link;
  SectionModel({
    required this.name,
    required this.chapters,
    required this.link,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      name: json['name'],
      chapters: json['sections'],
      link: json['link'],
    );
  }
}
