import 'package:flutter/material.dart';

import 'firestoreservice.dart';

class AddDeliveryBoyScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController ratingCountController = TextEditingController();
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Delivery Boy")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: contactController,
              decoration: InputDecoration(labelText: "Contact"),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: ratingController,
              decoration: InputDecoration(labelText: "Rating (0.0 - 5.0)"),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: ratingCountController,
              decoration: InputDecoration(labelText: "Rating Count"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Validate inputs
                if (nameController.text.isEmpty ||
                    contactController.text.isEmpty ||
                    ratingController.text.isEmpty ||
                    ratingCountController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please fill out all fields."),
                  ));
                  return;
                }

                // Validate rating values
                double rating = double.tryParse(ratingController.text) ?? 0.0;
                int ratingCount = int.tryParse(ratingCountController.text) ?? 0;

                // Call the FirestoreService to add the delivery boy
                await firestoreService.addDeliveryBoy(
                  name: nameController.text.trim(),
                  contact: contactController.text.trim(),
                  rating: rating,
                  ratingCount: ratingCount,
                );

                // Show a success message
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Delivery boy added successfully!"),
                ));

                // Clear the text fields
                nameController.clear();
                contactController.clear();
                ratingController.clear();
                ratingCountController.clear();
              },
              child: Text("Add Delivery Boy"),
            ),
          ],
        ),
      ),
    );
  }
}
