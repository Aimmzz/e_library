import 'package:e_library/constant/color_values.dart';
import 'package:e_library/constant/custom_size.dart';
import 'package:e_library/widgets/text_title.dart';
import 'package:flutter/material.dart';

class HeaderExplore extends StatelessWidget {
  final Function()? onTap;

  const HeaderExplore({
    super.key,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  height: 100,
                ),
                //tidak digunkan untuk sekarang
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 28.0,
                    ))
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextTitle(title: 'Add Your Book'),
                const Spacer(),
                IconButton(
                    onPressed: onTap,
                    icon: const Icon(
                      Icons.add,
                      color: ColorsValues.mainBlack,
                      size: 30.0,
                    )),
                gapW12
              ],
            ),
          ),
        ),
      ],
    );
  }
}