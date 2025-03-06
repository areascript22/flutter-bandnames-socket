class Band {
  final String id;
  final String name;
  final int votes;

  Band({
    required this.id,
    required this.name,
    required this.votes,
  });

  factory Band.fromMap(Map<String, dynamic> obj) => Band(
        id: obj['id'] ?? 'no-id',
        name: obj['name'] ?? 'no-names',
        votes: obj['votes'] ?? 'no-votes',
      );
}
