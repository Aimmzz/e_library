import 'package:flutter/material.dart';

Future<bool?> showConfirmationDialog(BuildContext context, String title, String message) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Kembali dengan false
            },
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Kembali dengan true
            },
            child: const Text('Hapus'),
          ),
        ],
      );
    },
  );
}
