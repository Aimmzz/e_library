import 'package:e_library/constant/color_values.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController customController;
  final String hintText;

  const CustomTextFiled(
      {super.key, required this.customController, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: customController,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: ColorsValues.mainBlack,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: ColorsValues.mainBlack,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: ColorsValues.mainBlack,
            width: 2,
          ),
        ),
      ),
    );
  }
}
