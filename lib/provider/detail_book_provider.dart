import 'package:e_library/features/book/add_book_page.dart';
import 'package:e_library/provider/add_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_library/data/database.dart';
import 'package:provider/provider.dart';

class DetailBookProvider with ChangeNotifier {
  late AppDb _database;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  DetailBookProvider() {
    _database = AppDb();
  }

  Future<void> updateFavorite(int bookId, int favorite) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _database.addFavorite(bookId, favorite);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteBook(int bookId) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _database.deleteBook(bookId);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> editBook(BuildContext context, Book book, AddBookProvider provider) async {
    provider.titleController.text = book.title;
    provider.authorController.text = book.author;
    provider.publisherController.text = book.publisher;
    provider.setSelectedYear(book.publishedYear.year);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChangeNotifierProvider.value(
          value: provider,
          child: const AddBookPage(),
        );
      },
    );
  }
}
