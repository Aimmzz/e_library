import 'package:e_library/provider/detail_book_provider.dart';
import 'package:e_library/widgets/header_detail_book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:io';

class DetailBookPage extends StatelessWidget {
  final String title;
  final String author;
  final DateTime createdAt;
  final DateTime publishedYear;
  final String? imagePath;
  final String pdfPath;
  final String publisher;

  const DetailBookPage({
    super.key,
    required this.title,
    required this.author,
    required this.createdAt,
    required this.publishedYear,
    required this.pdfPath,
    this.imagePath,
    required this.publisher
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailBookProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              HeaderDetailBook(
                title: title,
                author: author,
                createdAt: createdAt,
                publishedYear: publishedYear,
                imagePath: imagePath ?? '',
                pdfPath: pdfPath,
                publisher: publisher,
              ),
              Expanded(
                child: pdfPath.isNotEmpty
                    ? SfPdfViewer.file(File(pdfPath))
                    : const Center(
                        child: Text('No PDF available'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
