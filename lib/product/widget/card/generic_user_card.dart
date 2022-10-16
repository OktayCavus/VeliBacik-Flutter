import 'package:flutter/material.dart';
import 'package:flutter_application_2/303/generic_learn.dart';

class GenericUserCard extends StatelessWidget {
  const GenericUserCard({Key? key, required this.model}) : super(key: key);

  final genericUser model;

  @override
  Widget build(BuildContext context) {
    return Text(model.name);
  }
}