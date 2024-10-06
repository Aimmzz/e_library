import 'package:e_library/constant/color_values.dart';
import 'package:e_library/provider/search_provider.dart';
import 'package:e_library/widgets/card_search.dart';
import 'package:e_library/widgets/header_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValues.backgroundApp,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderSearch(), // Header untuk input pencarian
            Expanded(
              child: Consumer<SearchProvider>(
                builder: (context, provider, child) {
                  if (provider.books.isEmpty) {
                    return const Center(
                      child: Text('No books found.'),
                    );
                  }
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: provider.books.length,
                    itemBuilder: (context, index) {
                      final book = provider.books[index];
                      return CardSearch(
                        title: book.title,
                        author: book.author,
                        createdAt: book.createdAt,
                        publishedYear: book.publishedYear,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
