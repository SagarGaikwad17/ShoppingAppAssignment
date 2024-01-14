import 'package:flutter/material.dart';

class ErrorDialogUtils {
  static final ErrorDialogUtils _instance = ErrorDialogUtils.internal();

  ErrorDialogUtils.internal();

  factory ErrorDialogUtils() => _instance;

  static void showErrorCustomDialog(
    BuildContext context,
     String message,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error Occured'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OK!'),
          )
        ],
      ),
    );
  }
}
