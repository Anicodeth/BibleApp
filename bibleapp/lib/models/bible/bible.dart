import 'package:bibleapp/models/chapter/chapter.dart';
import 'package:bibleapp/models/section/section.dart';

class BibleModel {
  final String name;
  final List<SectionModel> sections;
  BibleModel({
    required this.name,
    required this.sections,
  });

  factory BibleModel.fromJson(Map<String, dynamic> json) {
    return BibleModel(
      name: json['name'],
      sections: json['sections'],
    );
  }
}
