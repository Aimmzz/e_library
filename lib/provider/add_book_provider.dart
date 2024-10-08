import 'package:drift/drift.dart';
import 'package:e_library/data/database.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddBookProvider with ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController publishedYearController = TextEditingController();
  final AppDb database = AppDb();

  int? _selectedYear;
  final List<int> _years = List.generate(122, (index) => 1980 + index);

  int? get selectedYear => _selectedYear;
  List<int> get years => _years;

  String? pdfPath; // Variable untuk path PDF
  String? imagePath; // Variable untuk path gambar

  void setSelectedYear(int? year) {
    _selectedYear = year;
    notifyListeners();
  }

  void setPdfPath(String path) {
    pdfPath = path;
    notifyListeners();
  }

  void setImagePath(String path) {
    imagePath = path;
    notifyListeners();
  }

  // Method untuk menghapus data di controller ketika menambah buku baru
  void clearFields() {
    titleController.clear();
    authorController.clear();
    publisherController.clear();
    _selectedYear = null;
    notifyListeners();
  }

  // Fungsi untuk memilih PDF
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

  // Fungsi untuk memilih gambar
  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      imagePath = result.files.single.path;
      notifyListeners();
    }
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

    await database.into(database.books).insert(
      BooksCompanion.insert(
        title: title,
        author: author,
        publisher: publisher,
        favorite: 1,
        createdAt: DateTime.now(),
        publishedYear: DateTime(publishedYear),
        pdfPath: Value(pdfPath), // Menyimpan path PDF
        imagePath: Value(imagePath), // Menyimpan path gambar
      ),
    );

    Navigator.of(context).pop();
  }

  void disposeControllers() {
    titleController.dispose();
    authorController.dispose();
    publisherController.dispose();
    publishedYearController.dispose();
  }
}
