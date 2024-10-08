import 'package:e_library/constant/custom_size.dart';
import 'package:e_library/provider/add_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatelessWidget {
  const AddBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddBookProvider(),
      child: Consumer<AddBookProvider>(
        builder: (context, provider, child) {
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
                  const Center(
                    child: Text(
                      'Add Book',
                      style: TextStyle(
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
                  
                  // Dropdown untuk memilih tahun terbit buku
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
                  gapH16,

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => provider.pickPdf(),
                          child: const Text('Upload PDF'),
                        ),
                      ),
                      if (provider.pdfPath != null)
                        const Icon(Icons.check_circle, color: Colors.green),
                    ],
                  ),
                  gapH16,

                  // Tombol untuk memilih Gambar
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => provider.pickImage(),
                          child: const Text('Upload Image'),
                        ),
                      ),
                      if (provider.imagePath != null)
                        const Icon(Icons.check_circle, color: Colors.green),
                    ],
                  ),
                  gapH24,

                  Center(
                    child: ElevatedButton(
                      onPressed: () => provider.saveBook(context),
                      child: const Text('Save Book'),
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
