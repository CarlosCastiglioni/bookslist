import 'package:bookslist/graphql/graphql_repository.dart';
import 'package:bookslist/shared/themes/app_text_styles.dart';
import 'package:bookslist/shared/widgets/favorite_authors/favorite_authors_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteAuthorsWidget extends StatefulWidget {
  const FavoriteAuthorsWidget({Key? key}) : super(key: key);

  @override
  State<FavoriteAuthorsWidget> createState() => _FavoriteAuthorsWidgetState();
}

class _FavoriteAuthorsWidgetState extends State<FavoriteAuthorsWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = GraphQlRepository();
    return Column(
      children: [
        Row(
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
        Consumer<FavoriteAuthorsController>(
            builder: (BuildContext context, value, child) {
          return Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
              ));
        }),
      ],
    );
  }
}
