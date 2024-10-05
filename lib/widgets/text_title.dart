import 'package:e_library/constant/color_values.dart';
import 'package:e_library/constant/custom_size.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String title;

  const TextTitle({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: TextSize.header,
        color: ColorsValues.mainBlack,
        fontWeight: FontWeight.bold),
    );
  }
}