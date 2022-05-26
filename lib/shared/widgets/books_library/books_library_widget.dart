import 'package:bookslist/graphql/graphql_mutation.dart';
import 'package:bookslist/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BooksLibraryWidget extends StatelessWidget {
  const BooksLibraryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Query(
            options: QueryOptions(document: gql(QueryAndMutation().booksQuery)),
            builder: (QueryResult result,
                {VoidCallback? refetch, FetchMore? fetchMore}) {
              if (result.hasException) {
                return const Text("Erro");
              }
              if (result.isLoading) {
                return const CircularProgressIndicator();
              }

              final repositories = result.data?['allBooks'];

              if (repositories == null) {
                return const Text("No repositories");
              }

              return Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: repositories?.length,
                    itemBuilder: ((context, i) {
                      final repository = repositories[i];
                      return SizedBox(
                        height: 69,
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 48,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(repository["cover"]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: SizedBox(
                                width: 272,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      repository["name"],
                                      style: TextStyles.list,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      repository["author"]["name"],
                                      style: TextStyles.listSubtitle,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
              );
            }));
  }
}
