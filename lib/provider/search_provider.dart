import 'package:flutter/material.dart';
import 'package:e_library/data/database.dart';

class SearchProvider with ChangeNotifier {
  late AppDb _database;
  List<Book> _books = [];
  List<Book> _filteredBooks = [];
  String _searchQuery = ''; 

  List<Book> get books => _filteredBooks;

  SearchProvider() {
    _database = AppDb();
    loadBooks();
  }

  Future<void> loadBooks() async {
    _books = await _database.getAllBook();
    _applySearchQuery();
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    _applySearchQuery();
    notifyListeners();
  }

  void _applySearchQuery() {
    if (_searchQuery.isEmpty) {
      _filteredBooks = _books;
    } else {
      _filteredBooks = _books.where((book) =>
          book.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          book.author.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
    }
  }
}
