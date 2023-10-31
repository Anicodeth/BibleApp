import 'dart:ffi';
import 'package:hive/hive.dart';

part 'plan.g.dart';

@HiveType(typeId: 2)
class Plan{

  @HiveField(0)
  final String title;

  @HiveField(1)
  final List<String> books;

  @HiveField(2)
  final String frequency;

  @HiveField(3)
  final DateTime startDate;

  @HiveField(4)
  final DateTime endDate;

  @HiveField(5)
  final List<String> days;

  Plan({required this.title, required this.books, required this.frequency, required this.startDate, required this.endDate, required this.days});

}