import 'package:bookslist/graphql/graphql_provider.dart';
import 'package:bookslist/pages/book_page/book_page.dart';
import 'package:bookslist/pages/home_page/home_page.dart';
import 'package:bookslist/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphqlClass().client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'bookslist',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: AppColors.secondary)),
        home: const HomePage(),
        routes: {"/book": ((context) => const BookPage())},
      ),
    );
  }
}
