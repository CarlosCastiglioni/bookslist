import 'package:bookslist/shared/themes/app_colors.dart';
import 'package:bookslist/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.backgroundBody),
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(32)),
        color: AppColors.backgroundTop,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 90,
                    width: 100,
                    child: Image.asset("assets/images/logo.png")),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19, top: 8),
              child: Row(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 5, color: AppColors.secondary))),
                      height: 46,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Meus Livros",
                            style: TextStyles.subtitle,
                          ))),
                  Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 5, color: AppColors.backgroundTop))),
                      height: 46,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Emprestados",
                            style: TextStyles.subtitle,
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
