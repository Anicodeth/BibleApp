class Verse {
  final int id;
  final int chapterId;
  final int verseNumber;
  final int bibleId;
  final String text;

  const Verse({
    required this.id,
    required this.chapterId,
    required this.verseNumber,
    required this.bibleId,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chapter_id': chapterId,
      'verse_number': verseNumber,
      'bible_id': bibleId,
      'text': text,
    };
  }

  @override
  String toString() {
    return 'Verse{id: $id, chapterId: $chapterId, verseNumber: $verseNumber, text: $text, `bibleId: $bibleId`}';
  }
}
