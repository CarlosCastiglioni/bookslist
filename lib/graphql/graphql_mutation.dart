class QueryAndMutation {
  String booksQuery = """
query booksInfo{
  allBooks{
    category
    cover
    name
    description
    author {
      name
    }
  }
  favoriteAuthors{
    name
    picture
    booksCount
  }
  favoriteBooks {
    cover
    name
    description
    author {
      name
    }
  }
} """;
}
