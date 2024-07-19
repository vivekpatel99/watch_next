import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class MySnackbarService {
  void customSnackbar(String message) {
    // Your logic to show the Snackbar goes here
    // You can use the ScaffoldMessenger to display the Snackbar
    // Example:
    final snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.white,
        onPressed: () {
          //TODO undo
        },
      ),
    );

    ScaffoldMessenger.of(StackedService.navigatorKey!.currentContext!)
        .showSnackBar(snackbar);
  }
}
