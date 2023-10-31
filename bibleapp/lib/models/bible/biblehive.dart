import 'package:hive/hive.dart';

part 'biblehive.g.dart';

@HiveType(typeId: 3)
class BibleModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String path;

  BibleModel({
    required this.name,
    required this.path,
  });
}
