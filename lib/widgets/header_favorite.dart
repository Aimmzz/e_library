import 'package:e_library/constant/color_values.dart';
import 'package:e_library/constant/custom_size.dart';
import 'package:e_library/widgets/text_title.dart';
import 'package:flutter/material.dart';

class HeaderFavorite extends StatelessWidget {
  const HeaderFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH12,
          TextTitle(title: 'Favorite'),
          Text(
            'Your Collection Here',
            style: TextStyle(
              color: ColorsValues.mainBlack,
              fontSize: TextSize.regular,
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}