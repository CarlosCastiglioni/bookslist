class Book {
  final String cover;
  final String name;
  final String description;
  final String authorId;

  Book({
    required this.cover,
    required this.name,
    required this.description,
    required this.authorId,
  });

  Book.fromJson(Map<String, dynamic> json)
      : cover = json['cover'],
        name = json['name'],
        description = json['description'],
        authorId = json['author']['id'];

  Map<String, dynamic> toJson() => {
        'cover': cover,
        'name': name,
        'description': description,
        'authorId': authorId
      };
}
