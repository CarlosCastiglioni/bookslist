import 'package:bookslist/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class BooksLibraryWidget extends StatelessWidget {
  const BooksLibraryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
        Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.vertical,
            ))
      ],
    );
  }
}
