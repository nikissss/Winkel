import 'package:flutter/material.dart';

class VendorProvider extends ChangeNotifier {
  double _totalEarnings = 0.0;

  Future<void> addEarnings(double amount) async {
    try {
      // Add the payment amount to the vendor's total earnings
      _totalEarnings += amount;

      // Notify listeners to update the UI
      notifyListeners();
    } catch (e) {
      throw Exception("Failed to add earnings: $e");
    }
  }

  double get totalEarnings => _totalEarnings;
}
