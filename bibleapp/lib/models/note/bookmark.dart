import 'package:hive/hive.dart';
part 'bookmark.g.dart';

@HiveType(typeId: 6)
class Bookmark {

  @HiveField(0)
  final String title; 
  @HiveField(1)
  final String tag;
  @HiveField(2)
  final String text;
  
  Bookmark({
    required this.title,
    required this.tag,
    required this.text,
  });
}
