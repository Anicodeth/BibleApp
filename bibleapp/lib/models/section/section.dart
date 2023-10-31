import 'package:hive/hive.dart';

part 'section.g.dart';

@HiveType(typeId: 3)
class SectionModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int chapters;

  @HiveField(2)
  final String link;

  SectionModel({
    required this.name,
    required this.chapters,
    required this.link,
  });
}
