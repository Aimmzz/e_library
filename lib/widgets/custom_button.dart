import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final Color color;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          color: Colors.white
        ),
      ),
    );
  }
}
