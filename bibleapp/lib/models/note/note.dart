import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  final String title; 

  @HiveField(1)
  final String tag;
  
  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final String note;

  Note({required this.title, required this.tag, required this.date, required this.note});
}
