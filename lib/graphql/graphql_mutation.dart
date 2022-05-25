class QueryAndMutation {
  String booksQuery = """
query booksInfo{
  favoriteBooks {
    cover
    name
    description
    author {
      id
    }
  }
} """;
}
