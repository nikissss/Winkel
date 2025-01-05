import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor_app/delivery/firestoreservice.dart';
//import 'package:multi_vendor_app/derlivery/firestoreservice.dart';
// import 'package:multi_vendor_app/orderchecking/ordercheckingroom.dart';
//import 'package:multi_vendor_app/views/buyers/inner_screens/deliverychatscreen.dart';
import 'package:multi_vendor_app/views/buyers/innerscreens/deliverychatscreen.dart'; // Import your OrderCheckingRoomScreen

class DeliveryBoyListScreen extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Delivery Boy'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('delivery_boys')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No delivery boys available"));
            }

            final deliveryBoys = snapshot.data!.docs;

            return ListView.builder(
              itemCount: deliveryBoys.length,
              itemBuilder: (context, index) {
                var deliveryBoy = deliveryBoys[index];

                // Extracting data from Firestore document
                String name = deliveryBoy['name'];
                String contact = deliveryBoy['contact'];
                double rating = deliveryBoy['rating'];
                int ratingCount = deliveryBoy['rating_count'];

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    leading: Icon(Icons.delivery_dining,
                        size: 40, color: Colors.blue),
                    title: Text(
                      name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Contact: $contact"),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            SizedBox(width: 5),
                            Text(
                              "$rating (${ratingCount} ratings)",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Navigate to the OrderCheckingRoomScreen after selecting a delivery boy
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeliveryChatPage(
                              deliveryBoyName:
                                  name, // Pass selected delivery boy's name or other data
                            ),
                          ),
                        );
                      },
                      child: Text("Choose"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .blue, // Replaced 'primary' with 'backgroundColor'
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
