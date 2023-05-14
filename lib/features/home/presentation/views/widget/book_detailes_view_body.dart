import 'package:flutter/material.dart';

import 'custom_book_details_app_bar.dart';

class BookDetailesViewBody extends StatelessWidget {
  const BookDetailesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: const [
          CustomBookDeatilesAppBar()
        ],
      ),
    );
  }
}
