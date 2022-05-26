import 'package:bookslist/graphql/graphql_mutation.dart';
import 'package:bookslist/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class FavoriteBooksWidget extends StatelessWidget {
  const FavoriteBooksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Livros favoritos",
                style: TextStyles.title,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "ver todos",
                    style: TextStyles.menu,
                  ))
            ],
          ),
        ),
        Query(
            options: QueryOptions(document: gql(QueryAndMutation().booksQuery)),
            builder: (QueryResult result,
                {VoidCallback? refetch, FetchMore? fetchMore}) {
              if (result.hasException) {
                return const Text("Erro");
              }
              if (result.isLoading) {
                return const CircularProgressIndicator();
              }

              final repositories = result.data?['favoriteBooks'];

              if (repositories == null) {
                return const Text("No repositories");
              }

              return Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                child: SizedBox(
                  height: 265,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: repositories?.length,
                      itemBuilder: ((context, i) {
                        final repository = repositories[i];
                        return Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: SizedBox(
                            height: 64,
                            width: 136,
                            child: GestureDetector(
                              onTap: () => Navigator.pushNamed(context, "/book",
                                  arguments: repository),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 198,
                                    width: 136,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                repository["cover"]),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    repository["name"],
                                    style: TextStyles.list,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    repository["author"]["name"],
                                    style: TextStyles.listSubtitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
                ),
              );
            })
      ],
    );
  }
}
