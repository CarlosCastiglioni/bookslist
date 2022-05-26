import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlClass {
  static HttpLink httpLink =
      HttpLink("https://us-central1-ss-devops.cloudfunctions.net/GraphQL");

  static Link linkr = httpLink;

  ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(link: linkr, cache: GraphQLCache(store: InMemoryStore())));
}
