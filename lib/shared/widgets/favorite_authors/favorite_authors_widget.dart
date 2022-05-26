import 'package:bookslist/graphql/graphql_mutation.dart';
import 'package:bookslist/shared/themes/app_colors.dart';
import 'package:bookslist/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class FavoriteAuthorsWidget extends StatelessWidget {
  const FavoriteAuthorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Autores favoritos",
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

              final repositories = result.data?['favoriteAuthors'];

              if (repositories == null) {
                return const Text("No repositories");
              }

              return Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                child: SizedBox(
                  height: 69,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: repositories?.length,
                      itemBuilder: ((context, i) {
                        final repository = repositories[i];
                        return Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: AppColors.border, width: 1)),
                            height: 69,
                            width: 248,
                            child: Row(
                              children: [
                                Container(
                                  height: 67,
                                  width: 63,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              repository["picture"]),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        repository["name"],
                                        style: TextStyles.list,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${repository["booksCount"]} Livros",
                                        style: TextStyles.listSubtitle,
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
