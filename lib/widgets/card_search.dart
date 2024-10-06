import 'package:e_library/constant/color_values.dart';
import 'package:e_library/constant/custom_size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardSearch extends StatelessWidget {
  final String title;
  final String author;
  final DateTime createdAt;
  final DateTime publishedYear;
  const CardSearch({
    super.key,
    required this.title,
    required this.author,
    required this.createdAt,
    required this.publishedYear,
  });

  @override
  Widget build(BuildContext context) {
    
    final String formattedDate = DateFormat('dd MMM yyyy').format(createdAt);
    final String formattedYear = DateFormat('yyyy').format(publishedYear);

    return Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 125,
              height: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/images/sample_profile.jpeg'),
                  fit: BoxFit.cover)),
            ),
          ),
          gapH8,
          Text(
            author,
            style: const TextStyle(
              color: ColorsValues.darkGrey,
              fontSize: TextSize.regular,
              fontWeight: FontWeight.w500,
            ),
          ),
          gapH4,
          Text(
            title,
            style: const TextStyle(
              color: ColorsValues.mainBlack,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
          ),
          gapH4,
          Row(
            children: [
              Text(
                formattedDate,
                style: const TextStyle(
                    color: ColorsValues.darkGrey,
                    fontSize: TextSize.regular,
                    fontStyle: FontStyle.italic),
              ),
              gapW4,
              const Icon(
                Icons.circle,
                size: 8,
                color: Colors.black,
              ),
              gapW4,
              Text(
                formattedYear,
                style: const TextStyle(
                    color: ColorsValues.darkGrey,
                    fontSize: TextSize.regular,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
