import 'package:e_library/constant/color_values.dart';
import 'package:e_library/features/book/edit_book_page.dart';
import 'package:e_library/provider/edit_book_provider.dart';
import 'package:e_library/provider/favorite_provider.dart';
import 'package:e_library/widgets/card_book.dart';
import 'package:e_library/widgets/delete_dialog.dart';
import 'package:e_library/widgets/header_favorite.dart';
import 'package:e_library/widgets/text_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<FavoriteProvider>(context, listen: false).fetchFavoriteBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValues.backgroundApp,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderFavorite(),
            Expanded(
              child: Consumer<FavoriteProvider>(
                builder: (context, provider, child) {

                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (provider.favoriteBooks.isEmpty) {
                    return const Center(
                      child: TextTitle(title: 'Tidak ada buku favorit.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: provider.favoriteBooks.length,
                    itemBuilder: (context, index) {
                      final book = provider.favoriteBooks[index];
                      final isFavorite = book.favorite == 2;

                      return CardBook(
                        title: book.title,
                        author: book.author,
                        createdAt: book.createdAt,
                        publishedYear: book.publishedYear,
                        publisher: book.publisher,
                        pdfPath: book.pdfPath,
                        imagePath: book.imagePath,
                        deleteBook: () async {
                          bool? confirmed = await showConfirmationDialog(
                            context,
                            'Konfirmasi Hapus',
                            'Apakah Anda yakin ingin menghapus buku "${book.title}"?',
                          );

                          if (confirmed == true) {
                            await provider.deleteBook(book.id);
                          }
                        },
                        addFavorite: () async {
                          int newFavoriteValue = isFavorite ? 1 : 2;
                          await provider.addFavorite(book.id, newFavoriteValue);
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
                              Provider.of<FavoriteProvider>(context, listen: false).fetchFavoriteBooks();
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
