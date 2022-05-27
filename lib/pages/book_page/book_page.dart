import 'package:bookslist/shared/themes/app_colors.dart';
import 'package:bookslist/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Map book = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.transparent),
                onPressed: () {},
                child: const Icon(Icons.more_vert))
          ],
          backgroundColor: Colors.transparent,
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(children: [
            Container(
                height: 320,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(book["cover"]), fit: BoxFit.cover),
                )),
            Positioned(
                top: 280,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(32)),
                      color: AppColors.backgroundTop),
                  height: size.height,
                  width: size.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 32),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 280,
                                child: Text(
                                  book["name"],
                                  style: TextStyles.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_outline))
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            book["author"]["name"],
                            style: TextStyles.authorDescription,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            book["description"],
                            style: TextStyles.listSubtitle,
                          ),
                          const SizedBox(
                            height: 400,
                          )
                        ],
                      ),
                    ),
                  ),
                ))
          ]),
        ));
  }
}
