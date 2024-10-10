import 'package:e_library/widgets/custom_stroke_button.dart';
import 'package:flutter/material.dart';

class CustomeDialog extends StatefulWidget {
  final String title;
  final String desc;

  const CustomeDialog(
      {super.key,
      required this.title,
      required this.desc,
  });

  @override
  State<CustomeDialog> createState() => _CustomeDialogState();
}

class _CustomeDialogState extends State<CustomeDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 200.0,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _topContainer(),
            const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomStrokeButton(
              text: 'Batal',
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              color: Colors.red,
              size: const Size(100, 40)),
                CustomStrokeButton(
              text: 'Hapus',
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              color: Colors.green,
              size: const Size(110, 40))
              ],
            ),
          ],
        ),
      ),
    );
  }

  _topContainer() {
    return Container(
      width: 300.0,
      height: 80.0,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          color: Colors.white),
      padding: const EdgeInsets.all(4.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          widget.title,
          style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20.0),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          widget.desc,
          style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 12.0),
        )
      ]),
    );
  }
}