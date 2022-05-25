import 'package:bookslist/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class FavoriteBooksWidget extends StatelessWidget {
  const FavoriteBooksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
        Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
            ))
      ],
    );
  }
}
