import 'package:flutter/material.dart';

class CustomStrokeButton extends StatefulWidget {
  final String text;
  final Function()? onPressed;
  final Color color;
  final Size size;
  
  const CustomStrokeButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.size,
  });

  @override
  State<CustomStrokeButton> createState() => _CustomStrokeButtonState();
}

class _CustomStrokeButtonState extends State<CustomStrokeButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: widget.color, width: 2),
        fixedSize: widget.size,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Poppins',
          color: widget.color,
        ),
      ),
    );
  }
}