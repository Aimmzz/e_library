import 'package:e_library/data/database.dart';
import 'package:e_library/provider/explorer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditBookProvider with ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController publishedYearController = TextEditingController();
  final AppDb database = AppDb();

  int? _selectedYear;
  int? _bookId;
  final List<int> _years = List.generate(122, (index) => 1980 + index);

  int? get selectedYear => _selectedYear;
  List<int> get years => _years;

  void setSelectedYear(int? year) {
    _selectedYear = year;
    notifyListeners();
  }

  void setBookData(Book book) {
    _bookId = book.id;
    titleController.text = book.title;
    authorController.text = book.author;
    publisherController.text = book.publisher;
    _selectedYear = book.publishedYear.year;
    notifyListeners();
  }

  void clearFields() {
    titleController.clear();
    authorController.clear();
    publisherController.clear();
    _selectedYear = null;
    _bookId = null;
    notifyListeners();
  }

  Future<void> updateBook(BuildContext context) async {
    final String title = titleController.text;
    final String author = authorController.text;
    final String publisher = publisherController.text;
    final int? publishedYear = _selectedYear;

    if (title.isEmpty || author.isEmpty || publisher.isEmpty || publishedYear == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

    if (_bookId != null) {
      await database.updateBook(
        _bookId!,
        title,
        author,
        DateTime(publishedYear),
        publisher,
      );

      Provider.of<ExplorerProvider>(context, listen: false).fetchBooks();

      Navigator.of(context).pop();
    }
  }

  void disposeControllers() {
    titleController.dispose();
    authorController.dispose();
    publisherController.dispose();
    publishedYearController.dispose();
  }
}
