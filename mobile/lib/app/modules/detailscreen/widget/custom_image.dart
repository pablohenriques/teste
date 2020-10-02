import 'dart:io';

import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(this.data);

  // ignore: prefer_typing_uninitialized_variables
  final File data;

  //custom image
  @override
  Widget build(BuildContext context) {
    return Image.file(
      data,
      height: 350,
      width: 400,
      fit: BoxFit.fitHeight,
    );
  }
}
