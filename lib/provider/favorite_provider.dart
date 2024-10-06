import 'package:e_library/data/database.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  late AppDb _database;
  List<Book> _favoriteBooks = [];
  
  List<Book> get favoriteBooks => _favoriteBooks;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  FavoriteProvider() {
    _database = AppDb();
  }

  Future<void> fetchFavoriteBooks() async {
    _setLoading(true);

    try {
      _favoriteBooks = await _database.getBookByFavorite(2);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> deleteBook(int bookId) async {
    await _database.deleteBook(bookId);
    await fetchFavoriteBooks();
  }

  Future<void> addFavorite(int bookId, int favorite) async {
    await _database.addFavorite(bookId, favorite);
    await fetchFavoriteBooks();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
