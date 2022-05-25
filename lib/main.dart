import 'package:bookslist/app_widget.dart';
import 'package:bookslist/shared/widgets/favorite_authors/favorite_authors_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => FavoriteAuthorsController()))
    ],
    child: const AppWidget(),
  ));
}
