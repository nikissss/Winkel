// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class CustomerOrderScreen extends StatelessWidget {
//   String formatedDate(date) {
//     final outPutDateFormate = DateFormat('dd/MM/yyyy');

//     final outPutDate = outPutDateFormate.format(date);

//     return outPutDate;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Stream<QuerySnapshot> _ordersStream = FirebaseFirestore.instance
//         .collection('orders')
//         .where('buyerId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .snapshots();

//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.yellow.shade900,
//           elevation: 0,
//           title: Text(
//             'My Orders',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 5,
//             ),
//           ),
//         ),
//         body: StreamBuilder<QuerySnapshot>(
//           stream: _ordersStream,
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               return Text('Something went wrong');
//             }

//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(color: Colors.yellow.shade900),
//               );
//             }

//             return ListView(
//               children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                 return Column(
//                   children: [
//                     ListTile(
//                       leading: CircleAvatar(
//                           backgroundColor: Colors.white,
//                           radius: 14,
//                           child: document['accepted'] == true
//                               ? Icon(Icons.delivery_dining)
//                               : Icon(Icons.access_time)),
//                       title: document['accepted'] == true
//                           ? Text(
//                               'Accepted',
//                               style: TextStyle(color: Colors.yellow.shade900),
//                             )
//                           : Text(
//                               'Not Accepted',
//                               style: TextStyle(
//                                 color: Colors.red,
//                               ),
//                             ),
//                       trailing: Text(
//                         'Amount' +
//                             ' ' +
//                             document['productPrice'].toStringAsFixed(2),
//                         style: TextStyle(fontSize: 17, color: Colors.blue),
//                       ),
//                       subtitle: Text(
//                         formatedDate(
//                           document['orderDate'].toDate(),
//                         ),
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                         'Order Details',
//                         style: TextStyle(
//                           color: Colors.yellow.shade900,
//                           fontSize: 15,
//                         ),
//                       ),
//                       subtitle: Text('View Order Details'),
//                       children: [
//                         ListTile(
//                           leading: CircleAvatar(
//                             child: Image.network(
//                               document['productImage'][0],
//                             ),
//                           ),
//                           title: Text(document['productName']),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     ('Quantity'),
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     document['quantity'].toString(),
//                                   ),
//                                 ],
//                               ),
//                               document['accepted'] == true
//                                   ? Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Text('Schedule Delivery Date'),
//                                         Text(formatedDate(
//                                             document['scheduleDate'].toDate()))
//                                       ],
//                                     )
//                                   : Text(''),
//                               ListTile(
//                                 title: Text(
//                                   'Buyer Details',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 subtitle: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(document['fullName']),
//                                     Text(document['email']),
//                                     Text(document['address']),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 );
//               }).toList(),
//             );
//           },
//         ));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:multi_vendor_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CustomerOrderScreen extends StatelessWidget {
  String formatedDate(date) {
    final outPutDateFormate = DateFormat('dd/MM/yyyy');
    return outPutDateFormate.format(date);
  }

  Future<Map<String, dynamic>> fetchUserDetails(String userId) async {
    final userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userSnapshot.exists
        ? userSnapshot.data() as Map<String, dynamic>
        : {};
  }

  Future<Map<String, dynamic>> fetchVendorDetails(String vendorId) async {
    final vendorSnapshot = await FirebaseFirestore.instance
        .collection('vendors')
        .doc(vendorId)
        .get();
    return vendorSnapshot.exists
        ? vendorSnapshot.data() as Map<String, dynamic>
        : {};
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final Stream<QuerySnapshot> _ordersStream = FirebaseFirestore.instance
        .collection('orders')
        .where('buyerId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade900,
        elevation: 0,
        title: const Text(
          'My Orders',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 5,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              cartProvider.clearCart();
            },
            icon: Icon(CupertinoIcons.delete),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _ordersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.yellow.shade900),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              final orderData = document.data() as Map<String, dynamic>;

              return FutureBuilder<Map<String, dynamic>>(
                future: Future.wait([
                  fetchUserDetails(orderData['buyerId']),
                  fetchVendorDetails(orderData['vendorId']),
                ]).then((results) => {
                      'customer': results[0],
                      'vendor': results[1],
                    }),
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>> asyncSnapshot) {
                  if (asyncSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (asyncSnapshot.hasError) {
                    return const Center(child: Text('Error fetching details.'));
                  }

                  final details = asyncSnapshot.data ?? {};
                  final customer = details['customer'] ?? {};
                  final vendor = details['vendor'] ?? {};

                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 14,
                          child: orderData['accepted'] == true
                              ? const Icon(Icons.delivery_dining)
                              : const Icon(Icons.access_time),
                        ),
                        title: orderData['accepted'] == true
                            ? Text(
                                'Accepted',
                                style: TextStyle(color: Colors.yellow.shade900),
                              )
                            : const Text(
                                'Not Accepted',
                                style: TextStyle(color: Colors.red),
                              ),
                        trailing: Text(
                          'Amount: \$${orderData['productPrice']?.toStringAsFixed(2) ?? 'N/A'}',
                          style:
                              const TextStyle(fontSize: 17, color: Colors.blue),
                        ),
                        subtitle: Text(
                          orderData['orderDate'] != null
                              ? formatedDate(orderData['orderDate'].toDate())
                              : 'N/A',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      ExpansionTile(
                        title: Text(
                          'Order Details',
                          style: TextStyle(
                              color: Colors.yellow.shade900, fontSize: 15),
                        ),
                        subtitle: const Text('View Order Details'),
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: orderData['productImage'] != null &&
                                      orderData['productImage'].isNotEmpty
                                  ? Image.network(orderData['productImage'][0])
                                  : const Icon(Icons.image),
                            ),
                            title: Text(orderData['productName'] ??
                                'Product Name Not Available'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                    'Quantity: ${orderData['quantity'] ?? 'N/A'}'),
                                const SizedBox(height: 10),
                                if (orderData['scheduleDate'] != null)
                                  Text(
                                    'Scheduled Delivery: ${formatedDate(orderData['scheduleDate'].toDate())}',
                                  ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Shipping Address:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(customer['pinCode'] ?? 'N/A'),
                                Text(customer['locality'] ?? 'N/A'),
                                Text(customer['city'] ?? 'N/A'),
                                Text(customer['state'] ?? 'N/A'),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
