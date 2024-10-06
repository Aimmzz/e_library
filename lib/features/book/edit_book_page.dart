import 'package:e_library/constant/custom_size.dart';
import 'package:e_library/provider/edit_book_provider.dart';
import 'package:e_library/widgets/text_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditBookPage extends StatelessWidget {
  const EditBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editBookProvider = Provider.of<EditBookProvider>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16, // Mengatur padding agar tidak tertutup keyboard
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Edit Book',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gapH16,
      
            const TextTitle(title: 'Title'),
            TextField(
              controller: editBookProvider.titleController,
              decoration: InputDecoration(
                labelText: 'Book Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            gapH16,
      
            const TextTitle(title: 'Author'),
            TextField(
              controller: editBookProvider.authorController,
              decoration: InputDecoration(
                hintText: 'Enter book author',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            gapH16,
      
            const TextTitle(title: 'Publisher'),
            TextField(
              controller: editBookProvider.publisherController,
              decoration: InputDecoration(
                hintText: 'Enter book publisher',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            gapH16,
      
            const TextTitle(title: 'Published Year'),
            DropdownButtonFormField<int>(
              value: editBookProvider.selectedYear,
              items: editBookProvider.years
                  .map((year) => DropdownMenuItem<int>(
                        value: year,
                        child: Text(year.toString()),
                      ))
                  .toList(),
              onChanged: (year) {
                editBookProvider.setSelectedYear(year);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Select published year',
              ),
            ),
            const SizedBox(height: 16),
      
            Center(
              child: ElevatedButton(
                onPressed: () {
                  editBookProvider.updateBook(context);
                },
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
