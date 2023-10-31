import 'package:hive/hive.dart';

part 'verse.g.dart';

@HiveType(typeId: 4)
class VerseModel {
  @HiveField(0)
  final String number;

  @HiveField(1)
  final String text;

  VerseModel({
    required this.number,
    required this.text,
  });
}
