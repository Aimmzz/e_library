import 'package:e_library/widgets/custom_dialog_delete.dart';
import 'package:flutter/material.dart';

Future<bool?> showConfirmationDialog(
    BuildContext context, String title, String message) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return CustomeDialog(
        title: title,
        desc: message,
      );
    },
  );
}
