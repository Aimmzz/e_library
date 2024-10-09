import 'package:e_library/data/database.dart';
import 'package:e_library/features/book/add_book_page.dart';
import 'package:flutter/material.dart';

class ExplorerProvider with ChangeNotifier {
  late AppDb _database;

  List<Book> _book = [];
  List<Book> get books => _book;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ExplorerProvider() {
    _database = AppDb();
  }
  
  Future<void> fetchBooks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _book = await _database.getAllBook();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteBook(int bookId) async {
    await _database.deleteBook(bookId);
    fetchBooks();
  }

  Future<void> updateFavorite(int bookId, int favorite) async {
    await _database.addFavorite(bookId, favorite);
    fetchBooks();
  }

  // membuka dialog tambah
  Future<void> openAddBookPage(BuildContext context) async {
    await showModalBottomSheet(
      // isScrollControlled: true,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      // ),
      context: context,
      builder: (context) {
        return const AddBookPage();
      },
    );

    fetchBooks();
  }
}