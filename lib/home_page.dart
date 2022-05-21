import 'package:bookslist/shared/themes/app_colors.dart';
import 'package:bookslist/shared/themes/app_text_styles.dart';
import 'package:bookslist/shared/widgets/app_bar_widget.dart';
import 'package:bookslist/shared/widgets/bottom_navigation_widget.dart';
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Livros favoritos",
                      style: TextStyles.title,
                    ),
                    TextButton(onPressed: () {}, child: const Text("ver todos"))
                  ],
                ),
                Container(height: 100, child: ListView())
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationWidget());
  }
}
