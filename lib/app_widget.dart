import 'package:bookslist/home_page.dart';
import 'package:bookslist/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: AppColors.secondary)),
      home: HomePage(),
    );
  }
}
