import 'package:e_library/constant/color_values.dart';
import 'package:e_library/constant/custom_size.dart';
import 'package:flutter/material.dart';

class ButtonBottombar extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final Function() onTap;

  const ButtonBottombar({
    Key? key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? ColorsValues.mainBlack : ColorsValues.mainGrey,
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: TextSize.regular,
              color: isSelected ? ColorsValues.mainBlack : ColorsValues.mainGrey,
            ),
          ),
        ],
      ),
    );
  }
}