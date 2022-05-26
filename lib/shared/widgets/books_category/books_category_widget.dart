import 'package:bookslist/graphql/graphql_mutation.dart';
import 'package:bookslist/shared/themes/app_colors.dart';
import 'package:bookslist/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BooksCategoryWidget extends StatefulWidget {
  const BooksCategoryWidget({Key? key}) : super(key: key);

  @override
  State<BooksCategoryWidget> createState() => _BooksCategoryState();
}

class _BooksCategoryState extends State<BooksCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    var buttonIndex = 0;
    final mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Bibilioteca",
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

              final repositories = result.data?['allBooks'];

              if (repositories == null) {
                return const Text("No repositories");
              }
              return SizedBox(
                width: mediaQuery.width,
                height: 50,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: repositories?.length,
                    itemBuilder: ((context, i) {
                      final categories = repositories
                          .map((item) => item["category"])
                          .toSet()
                          .toList();
                      return Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: [
                              if (i < categories.length)
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor: buttonIndex == i
                                            ? MaterialStateProperty.all(
                                                AppColors.secondary)
                                            : MaterialStateProperty.all(
                                                AppColors.backgroundTop),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16)))),
                                    child: Text(
                                      categories[i],
                                      style: buttonIndex == i
                                          ? TextStyles.buttonClicked
                                          : TextStyles.button,
                                    )),
                            ],
                          ));
                    })),
              );
            })
      ],
    );
  }
}
