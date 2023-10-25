class Bible {
  final int id;
  final String name;

  const Bible({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Bible{id: $id, name: $name}';
  }
}
