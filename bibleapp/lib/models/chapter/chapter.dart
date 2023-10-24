import '../verse/verse.dart';

class ChapterModel {
  final String name;
  final List<VerseModel> verses;
  ChapterModel({
    required this.name,
    required this.verses,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      name: json['name'],
      verses: json['verses'],
    );
  }
}
