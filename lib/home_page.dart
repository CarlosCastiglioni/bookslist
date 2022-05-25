import 'package:bookslist/shared/themes/app_colors.dart';
import 'package:bookslist/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:bookslist/shared/widgets/books_library/books_library_widget.dart';
import 'package:bookslist/shared/widgets/bottom_navigation/bottom_navigation_widget.dart';
import 'package:bookslist/shared/widgets/favorite_authors/favorite_authors_widget.dart';
import 'package:bookslist/shared/widgets/favorite_books/favorite_books_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(128),
          child: AppBarWidget(),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 32),
          child: Container(
            color: AppColors.backgroundBody,
            child: Column(
              children: const [
                FavoriteBooksWidget(),
                FavoriteAuthorsWidget(),
                BooksLibraryWidget(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationWidget());
  }
}
