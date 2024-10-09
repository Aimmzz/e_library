import 'package:e_library/constant/color_values.dart';
import 'package:e_library/constant/custom_size.dart';
import 'package:e_library/provider/edit_book_provider.dart';
import 'package:e_library/widgets/custom_button.dart';
import 'package:e_library/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditBookPage extends StatelessWidget {
  const EditBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final editBookProvider = Provider.of<EditBookProvider>(context);

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
                'Edit Book',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gapH16,
            CustomTextFiled(
                customController: editBookProvider.titleController,
                hintText: 'Book Title'),
            gapH16,
            CustomTextFiled(
                customController: editBookProvider.authorController,
                hintText: 'Enter Book Author'),
            gapH16,
            CustomTextFiled(
                customController: editBookProvider.publisherController,
                hintText: 'Enter Book Publisher'),
            gapH16,
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
                hintText: 'Select published year',
              ),
            ),
            gapH16,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      onPressed: () => editBookProvider.pickPdf(),
                      title: 'Upload PDF',
                      color: ColorsValues.mainBlack),
                ),
                if (editBookProvider.pdfPath != null)
                  const Icon(Icons.check_circle, color: Colors.green),
              ],
            ),
            gapH16,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      onPressed: () => editBookProvider.pickImage(),
                      title: 'Upload Book Image',
                      color: ColorsValues.mainBlack),
                ),
                if (editBookProvider.imagePath != null)
                  const Icon(Icons.check_circle, color: Colors.green),
              ],
            ),
            gapH24,
            Center(
              child: CustomButton(
                  onPressed: () => editBookProvider.updateBook(context),
                  title: 'Save Edit Book',
                  color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
