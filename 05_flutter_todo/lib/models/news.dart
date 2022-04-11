class News {
  late String title;
  late String description;

  News({
    required this.title,
    required this.description,
  });

  News.fromMap(Map<String, dynamic>? map) {
    title = map?['title'] ?? '';
    description = map?['description'] ?? '';
  }
}
