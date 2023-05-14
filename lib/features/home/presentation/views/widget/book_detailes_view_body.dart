import 'package:bookly/features/home/presentation/views/widget/custom_book_item.dart';
import 'package:flutter/material.dart';

import 'custom_book_details_app_bar.dart';

class BookDetailesViewBody extends StatelessWidget {
  const BookDetailesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children:  [
          const CustomBookDeatilesAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width* 0.17),
            child: const CustomBookImage(),
          ),
        ],
      ),
    );
  }
}
