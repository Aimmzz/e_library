import 'package:e_library/constant/custom_size.dart';
import 'package:e_library/provider/add_book_provider.dart';
import 'package:e_library/data/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatelessWidget {
  final Book? book;

  const AddBookPage({super.key, this.book});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddBookProvider(),
      child: Consumer<AddBookProvider>(
        builder: (context, provider, child) {
          // Jika dalam mode edit, isi data form dengan data buku yang diberikan
          if (book != null) {
            provider.loadBookData(book!);
          }

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      provider.isEditMode ? 'Edit Book' : 'Add Book',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  gapH16,

                  TextField(
                    controller: provider.titleController,
                    decoration: InputDecoration(
                      labelText: 'Book Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  gapH16,

                  TextField(
                    controller: provider.authorController,
                    decoration: InputDecoration(
                      labelText: 'Book Author',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  gapH16,

                  TextField(
                    controller: provider.publisherController,
                    decoration: InputDecoration(
                      labelText: 'Book Publisher',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  gapH16,
                  
                  DropdownButtonFormField<int>(
                    value: provider.selectedYear,
                    items: provider.years.map((int year) {
                      return DropdownMenuItem<int>(
                        value: year,
                        child: Text(year.toString()),
                      );
                    }).toList(),
                    onChanged: (int? newYear) {
                      provider.setSelectedYear(newYear);
                    },
                    decoration: InputDecoration(
                      labelText: 'Published Year',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  gapH24,

                  Center(
                    child: ElevatedButton(
                      onPressed: () => provider.saveBook(context),
                      child: Text(provider.isEditMode ? 'Update Book' : 'Save Book'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
