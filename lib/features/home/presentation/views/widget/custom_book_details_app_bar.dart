import 'package:flutter/material.dart';

class CustomBookDeatilesAppBar extends StatelessWidget {
  const CustomBookDeatilesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){}, icon:const Icon(Icons.close)),
        IconButton(onPressed: (){}, icon:const Icon(Icons.shopping_cart_outlined))
      ],
    );
  }
}
