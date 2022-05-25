import 'package:bookslist/graphql/graphql_mutation.dart';
import 'package:bookslist/graphql/graphql_provider.dart';
import 'package:bookslist/model/book.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlRepository {
  Future<List<Book>> getBooks() async {
    GraphQLClient client = GraphqlClass().clientToQuery();
    QueryResult result = await client
        .query(QueryOptions(document: gql(QueryAndMutation().booksQuery)));
    List<Map<String, dynamic>> books = [];
    final json = result.data?['favoriteBooks']
        .map((json) => Book.fromJson(json))
        .toList()
        .cast<Book>();
    return json;
  }
}
