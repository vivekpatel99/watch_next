import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class MySnackbarService {
  void customSnackbar(String message, VoidCallback undoAction) {
    // Your logic to show the Snackbar goes here
    // You can use the ScaffoldMessenger to display the Snackbar
    // Example:
    final snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor:
          Color.fromARGB(150, 128, 128, 128), // Gray transparent color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      action: SnackBarAction(
        label: 'Undo',
        textColor: Colors.white,
        onPressed: undoAction,
      ),
    );

    ScaffoldMessenger.of(StackedService.navigatorKey!.currentContext!)
        .showSnackBar(snackbar);
  }
}
