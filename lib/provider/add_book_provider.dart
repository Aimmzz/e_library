import 'package:e_library/data/database.dart';
import 'package:flutter/material.dart';

class AddBookProvider with ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController publishedYearController = TextEditingController();
  final AppDb database = AppDb();

  int? _selectedYear;
  int? _bookId;
  bool _isEditMode = false;
  final List<int> _years = List.generate(122, (index) => 1980 + index);

  int? get selectedYear => _selectedYear;
  List<int> get years => _years;

  bool get isEditMode => _isEditMode;

  void setSelectedYear(int? year) {
    _selectedYear = year;
    notifyListeners();
  }

  void loadBookData(Book book) {
    titleController.text = book.title;
    authorController.text = book.author;
    publisherController.text = book.publisher;
    _selectedYear = book.publishedYear.year;
    _bookId = book.id;
    _isEditMode = true;
    notifyListeners();
  }

  Future<void> saveBook(BuildContext context) async {
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

    if (_isEditMode && _bookId != null) {
      await database.updateBook(
        _bookId!,
        title,
        author,
        DateTime(publishedYear),
        1, // Favorit status
      );
      print('Buku di edit');
    } else {
      await database.into(database.books).insert(
        BooksCompanion.insert(
          title: title,
          author: author,
          publisher: publisher,
          favorite: 1,
          createdAt: DateTime.now(),
          publishedYear: DateTime(publishedYear),
        ),
      );
      print('Buku di tambah');
    }

    Navigator.of(context).pop();
  }

  void disposeControllers() {
    titleController.dispose();
    authorController.dispose();
    publisherController.dispose();
    publishedYearController.dispose();
  }
}