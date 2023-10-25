class Chapter {
  final int id;
  final int bibleId;
  final String bookName;
  final int chapterNumber;

  const Chapter({
    required this.id,
    required this.bibleId,
    required this.bookName,
    required this.chapterNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bible_id': bibleId,
      'book_name': bookName,
      'chapter_number': chapterNumber,
    };
  }

  @override
  String toString() {
    return 'Chapter{id: $id, bibleId: $bibleId, bookName: $bookName, chapterNumber: $chapterNumber}';
  }
}
