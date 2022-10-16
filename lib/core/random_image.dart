

import 'package:flutter/material.dart';


class randomImage extends StatelessWidget {
  const randomImage({Key? key, this.height=100}) : super(key: key);
final imageUrl='https://picsum.photos/200/300';
final double height;

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl,height: height,fit: BoxFit.cover,);
  }
}