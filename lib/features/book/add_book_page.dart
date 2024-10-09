import 'package:e_library/constant/color_values.dart';
import 'package:e_library/constant/custom_size.dart';
import 'package:e_library/provider/add_book_provider.dart';
import 'package:e_library/widgets/custom_button.dart';
import 'package:e_library/widgets/custom_text_filed.dart';
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
          return Container(
            margin: const EdgeInsets.all(16),
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: SingleChildScrollView(
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
                  CustomTextFiled(
                      customController: provider.titleController,
                      hintText: 'Book Title'),
                  gapH16,
                  CustomTextFiled(
                      customController: provider.authorController,
                      hintText: 'Book Author'),
                  gapH16,
                  CustomTextFiled(
                      customController: provider.publisherController,
                      hintText: 'Book Publisher'),
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
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: ColorsValues.mainBlack,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: ColorsValues.mainBlack,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: ColorsValues.mainBlack,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  gapH16,
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: () => provider.pickPdf(),
                          title: 'Upload PDF',
                          color: ColorsValues.mainBlack,
                        ),
                      ),
                      if (provider.pdfPath != null)
                        const Icon(Icons.check_circle, color: Colors.green),
                    ],
                  ),
                  gapH16,
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: () => provider.pickImage(),
                          title: 'Upload Book Image',
                          color: ColorsValues.mainBlack,
                        ),
                      ),
                      if (provider.imagePath != null)
                        const Icon(Icons.check_circle, color: Colors.green),
                    ],
                  ),
                  gapH24,
                  Center(
                    child: CustomButton(
                        onPressed: () => provider.saveBook(context),
                        title: 'Save Book',
                        color: Colors.green),
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
