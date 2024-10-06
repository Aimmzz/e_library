import 'package:e_library/constant/color_values.dart';
import 'package:e_library/features/book/edit_book_page.dart';
import 'package:e_library/provider/edit_book_provider.dart';
import 'package:e_library/provider/explorer_provider.dart';
import 'package:e_library/widgets/card_book.dart';
import 'package:e_library/widgets/delete_dialog.dart';
import 'package:e_library/widgets/header_explore.dart';
import 'package:e_library/widgets/text_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ExplorerProvider>(context, listen: false).fetchBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValues.backgroundApp,
      body: SafeArea(
        child: Column(
          children: [
            HeaderExplore(
              onTap: () {
                Provider.of<ExplorerProvider>(context, listen: false).openAddBookPage(context);
              },
            ),
            Expanded(
              child: Consumer<ExplorerProvider>(
                builder: (context, provider, child) {

                  if (provider.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (provider.books.isEmpty) {
                    return const Center(
                      child: TextTitle(title: 'No books available'),
                    );
                  }

                  return ListView.builder(
                    itemCount: provider.books.length,
                    itemBuilder: (context, index) {
                      final book = provider.books[index];
                      final isFavorite = book.favorite == 2;

                      return CardBook(
                        title: book.title,
                        author: book.author,
                        createdAt: book.createdAt,
                        publishedYear: book.publishedYear,
                        deleteBook: () async {
                          bool? confirmed = await showConfirmationDialog(
                            context,
                            'Konfirmasi Hapus',
                            'Apakah Anda yakin ingin menghapus buku "${book.title}"?',
                          );

                          if (confirmed == true) {
                            await Provider.of<ExplorerProvider>(context, listen: false).deleteBook(book.id);
                          }
                        },
                        addFavorite: () async {
                          int newFavoriteValue = isFavorite ? 0 : 2;
                          await Provider.of<ExplorerProvider>(context, listen: false).updateFavorite(book.id, newFavoriteValue);
                        },
                        editBook: () {
                          final editProvider = Provider.of<EditBookProvider>(context, listen: false);
                          editProvider.setBookData(book);

                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const EditBookPage();
                            },
                          ).then((value) {
                            if (value == true) {
                              Provider.of<ExplorerProvider>(context, listen: false).fetchBooks();
                            }
                          });
                        },
                        isFavorite: isFavorite,
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
