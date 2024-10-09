import 'package:e_library/data/database.dart';
import 'package:e_library/provider/explorer_provider.dart';
import 'package:e_library/provider/favorite_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditBookProvider with ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController publishedYearController = TextEditingController();
  final AppDb database = AppDb();

  String? pdfPath;
  String? imagePath;
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
    pdfPath = book.pdfPath;
    imagePath = book.imagePath;
    notifyListeners();
  }

  void clearFields() {
    titleController.clear();
    authorController.clear();
    publisherController.clear();
    _selectedYear = null;
    pdfPath = null;
    imagePath = null;
    _bookId = null;
    notifyListeners();
  }

  Future<void> pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      pdfPath = result.files.single.path;
      notifyListeners();
    }
  }

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      imagePath = result.files.single.path;
      notifyListeners();
    }
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
        pdfPath: pdfPath,
        imagePath: imagePath,
      );

      // Update halaman explorer dan favorite
      Provider.of<ExplorerProvider>(context, listen: false).fetchBooks();
      Provider.of<FavoriteProvider>(context, listen: false).fetchFavoriteBooks();

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
