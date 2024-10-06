import 'package:e_library/constant/color_values.dart';
import 'package:e_library/constant/custom_size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardBook extends StatelessWidget {
  final String title;
  final String author;
  final DateTime createdAt;
  final DateTime publishedYear;
  final Function() deleteBook;
  final Function() addFavorite;
  final Function() editBook;
  final bool isFavorite;

  const CardBook({
    super.key,
    required this.title,
    required this.author,
    required this.createdAt,
    required this.publishedYear,
    required this.deleteBook,
    required this.addFavorite,
    required this.isFavorite,
    required this.editBook,
  });

  @override
  Widget build(BuildContext context) {
    
    final String formattedDate = DateFormat('dd MMM yyyy').format(createdAt);
    final String formattedYear = DateFormat('yyyy').format(publishedYear);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 130,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          Container(
            height: 96,
            width: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/sample_profile.jpeg'),
                fit: BoxFit.cover
              ),
            ),
          ),
          gapW8,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      author,
                      style: const TextStyle(
                        color: ColorsValues.darkGrey,
                        fontSize: TextSize.regular,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: addFavorite,
                      child: Icon(
                        isFavorite
                            ? Icons.bookmark_rounded
                            : Icons.bookmark_border_rounded,
                        color: isFavorite ? Colors.green : ColorsValues.mainBlack,
                        size: 24.0,
                      ),
                    ),

                    PopupMenuButton<int>(
                      icon: const Icon(Icons.more_horiz_outlined),
                      onSelected: (value) {
                        if (value == 1) {
                          editBook();
                        } else if (value == 2) {
                          deleteBook();
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 1,
                          child: Row(
                            children: [
                              Icon(Icons.edit, color: Colors.blue),
                              SizedBox(width: 8),
                              Text("Edit"),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: Colors.red),
                              SizedBox(width: 8),
                              Text("Delete"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: TextSize.subTitle,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                gapH8,
                Row(
                  children: [
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        color: ColorsValues.darkGrey,
                        fontSize: TextSize.regular,
                        fontStyle: FontStyle.italic
                      ),
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
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}