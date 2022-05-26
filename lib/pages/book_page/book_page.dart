import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App Bar!'),
          // flexibleSpace: Image(
          //   image: NetworkImage(repository["cover"]),
          //   fit: BoxFit.cover,
          // ),
          backgroundColor: Colors.transparent,
        ),
        body: Container());
  }
}
