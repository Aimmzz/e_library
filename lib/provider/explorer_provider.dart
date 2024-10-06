import 'package:e_library/data/database.dart';
import 'package:e_library/features/book/add_book_page.dart';
import 'package:e_library/provider/add_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddBookPage();
      }
    );

    fetchBooks();
  }

  // membuka dialog edit
  void openEditBookPage(BuildContext context, Book book) {
    final provider = AddBookProvider();

    provider.titleController.text = book.title;
    provider.authorController.text = book.author;
    provider.publisherController.text = book.publisher;
    provider.setSelectedYear(book.publishedYear.year);

    showDialog(
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