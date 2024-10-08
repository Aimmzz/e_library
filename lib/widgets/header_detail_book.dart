import 'dart:io';

import 'package:e_library/constant/custom_size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderDetailBook extends StatelessWidget {
  final String title;
  final String author;
  final DateTime createdAt;
  final DateTime publishedYear;
  final String imagePath;
  final String pdfPath;
  final String publisher;

  const HeaderDetailBook({
    super.key,
    required this.title,
    required this.author,
    required this.createdAt,
    required this.publishedYear,
    required this.imagePath,
    required this.pdfPath,
    required this.publisher
  });

  @override
  Widget build(BuildContext context) {
    final String formattedPublishedYear = DateFormat('yyyy').format(publishedYear);
    final String formattedCreatedAt = DateFormat('dd MMM yyyy').format(createdAt);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        image: imagePath.isNotEmpty
            ? DecorationImage(
                image: FileImage(File(imagePath)),
                fit: BoxFit.cover,
              )
            : const DecorationImage(
                image: AssetImage('assets/images/sample_profile2.jpeg'),
                fit: BoxFit.cover,
              ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  author,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: TextSize.regular,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis
                  ),
                  maxLines: 1,
                ),
                gapH4,
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: TextSize.header,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      formattedCreatedAt,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: TextSize.regular,
                      ),
                    ),
                    gapW4,
                    const Icon(
                      Icons.circle,
                      size: 4,
                      color: Colors.white,
                    ),
                    gapW4,
                    Text(
                      formattedPublishedYear,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: TextSize.regular,
                      ),
                    ),
                    gapW4,
                    const Icon(
                      Icons.circle,
                      size: 4,
                      color: Colors.white,
                    ),
                    gapW4,
                    Text(
                      publisher,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: TextSize.regular,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
