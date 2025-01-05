// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:multi_vendor_app/provider/cart_provider.dart';
// import 'package:multi_vendor_app/provider/vendor_provider.dart';
// import 'package:multi_vendor_app/views/buyers/payment/api.dart';
// import 'package:multi_vendor_app/views/buyers/payment/khaltipayment.dart';
// import 'package:provider/provider.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final CartProvider _cartProvider = Provider.of<CartProvider>(context);
//     // final VendorProvider _vendorProvider = Provider.of<VendorProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey,
//         elevation: 0,
//         title: const Text(
//           'Cart Screen',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 4,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               _cartProvider.removeallItems();
//             },
//             icon: Icon(
//               CupertinoIcons.delete,
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: _cartProvider.getCartItem.isNotEmpty
//                 ? ListView.builder(
//                     itemCount: _cartProvider.getCartItem.length,
//                     itemBuilder: (context, index) {
//                       final cartData =
//                           _cartProvider.getCartItem.values.toList()[index];
//                       return Card(
//                         child: SizedBox(
//                           height: 170,
//                           child: Row(
//                             children: [
//                               SizedBox(
//                                 height: 100,
//                                 width: 100,
//                                 child: Image.network(cartData.imageUrl[0]),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: SingleChildScrollView(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         cartData.productName,
//                                         style: const TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold,
//                                           letterSpacing: 5,
//                                         ),
//                                       ),
//                                       Text(
//                                         '\S ${cartData.price.toStringAsFixed(2)}',
//                                         style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold,
//                                           letterSpacing: 5,
//                                           color: Colors.yellow.shade900,
//                                         ),
//                                       ),
//                                       OutlinedButton(
//                                         onPressed: null,
//                                         child: Text(cartData.productSize),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Container(
//                                             height: 30,
//                                             width: 170,
//                                             decoration: BoxDecoration(
//                                               color: Colors.red.shade400,
//                                             ),
//                                             child: Row(
//                                               children: [
//                                                 IconButton(
//                                                   onPressed:
//                                                       cartData.quantity == 1
//                                                           ? null
//                                                           : () {
//                                                               _cartProvider
//                                                                   .decreement(
//                                                                       cartData);
//                                                             },
//                                                   icon: const Icon(
//                                                     CupertinoIcons.minus,
//                                                     color: Colors.white,
//                                                     size: 15,
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   cartData.quantity.toString(),
//                                                   style: const TextStyle(
//                                                       color: Colors.white),
//                                                 ),
//                                                 IconButton(
//                                                   onPressed: () {
//                                                     _cartProvider
//                                                         .increement(cartData);
//                                                   },
//                                                   icon: const Icon(
//                                                     CupertinoIcons.plus,
//                                                     color: Colors.white,
//                                                     size: 15,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           IconButton(
//                                             onPressed: () {
//                                               _cartProvider.removeItem(
//                                                 cartData.productId,
//                                               );
//                                             },
//                                             icon: const Icon(
//                                               CupertinoIcons.cart_badge_minus,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   )
//                 : Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'Your shopping cart is empty',
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 5,
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Container(
//                           height: 40,
//                           width: MediaQuery.of(context).size.width - 40,
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 13, 62, 86),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               "Continue Shopping",
//                               style: TextStyle(
//                                 fontSize: 19,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 50,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.red.shade400,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 // child: Text(
//                 //   '\$${_cartProvider.totalPrice.toStringAsFixed(2)}\nCHECKOUT',
//                 //   textAlign: TextAlign.center,
//                 //   style: const TextStyle(
//                 //     color: Colors.white,
//                 //     letterSpacing: 8,
//                 //     fontSize: 18,
//                 //     fontWeight: FontWeight.bold,
//                 //   ),
//                 // ),
//                 //   child: TextButton(
//                 //     child: Text(
//                 //       '\$${_cartProvider.totalPrice.toStringAsFixed(2)}\nCHECKOUT',
//                 //       textAlign: TextAlign.center,
//                 //       style: const TextStyle(
//                 //         color: Colors.white,
//                 //         letterSpacing: 8,
//                 //         fontSize: 18,
//                 //         fontWeight: FontWeight.bold,
//                 //       ),
//                 //     ),
//                 //     onPressed: () {
//                 //       // Navigator.push(context,
//                 //       //     MaterialPageRoute(builder: (context) => LoginScreen()));
//                 //       void onKhaltiPressed() async {
//                 //         var response = await fetchPID(_cartProvider.totalPrice);
//                 //         // var publicKey= await
//                 //         if (response.containsKey("error")) {
//                 //           print("khalti error: ${response["error"]}");
//                 //           // TODO: toast error
//                 //           return;
//                 //         }
//                 //         if (context.mounted) {
//                 //           Navigator.push(
//                 //               context,
//                 //               MaterialPageRoute(
//                 //                   builder: (context) => KhaltiPaymentPage(
//                 //                         response: response,
//                 //                         onPaymentSuccessful: () {},
//                 //                       )));
//                 //         }
//                 //       }
//                 //     },
//                 //   ),
//                 child: TextButton(
//                   child: Text(
//                     '\$${_cartProvider.totalPrice.toStringAsFixed(2)}\nCHECKOUT',
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       letterSpacing: 8,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   onPressed: () async {
//                     var response = await fetchPID(_cartProvider.totalPrice);
//                     if (response.containsKey("error")) {
//                       print("khalti error: ${response["error"]}");
//                       // TODO: Add error handling or a toast message
//                       return;
//                     }
//                     if (context.mounted) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => KhaltiPaymentPage(
//                             response: response,
//                             onPaymentSuccessful: () {
//                               // Handle successful payment
//                               // print("Payment Successful");
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text('Successful Payment')),
//                               );
//                             },
//                             // onPaymentSuccessful: () async {
//                             //   // Handle successful payment
//                             //   try {
//                             //     // Add item to the buyer's order screen
//                             //     await _cartProvider.addToOrders();

//                             //     // Add price to the vendor's earnings
//                             //     // await _vendorProvider
//                             //     //     .addEarnings(_cartProvider.totalPrice);

//                             //     // Optionally show a success message
//                             //     ScaffoldMessenger.of(context).showSnackBar(
//                             //       SnackBar(
//                             //           content: Text('Payment successful!')),
//                             //     );
//                             //   } catch (e) {
//                             //     // Handle errors
//                             //     print("Error updating order or earnings: $e");
//                             //     ScaffoldMessenger.of(context).showSnackBar(
//                             //       SnackBar(content: Text('An error occurred!')),
//                             //     );
//                             //   }
//                             // },
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

////puja ko code ho yo chai
///
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:multi_vendor_app/provider/cart_provider.dart';
// import 'package:provider/provider.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final CartProvider _cartProvider = Provider.of<CartProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey,
//         elevation: 0,
//         title: Text(
//           'Cart Screen',
//           style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 4),
//         ),
//       ),
//       body: ListView.builder(
//           shrinkWrap: true,
//           itemCount: _cartProvider.getCartItem.length,
//           itemBuilder: (context, index) {
//             final cartData = _cartProvider.getCartItem.values.toList()[index];
//             return Card(
//               child: SizedBox(
//                 height: 170,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       height: 100,
//                       width: 100,
//                       child: Image.network(cartData.imageUrl[0]),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             cartData.productName,
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 5),
//                           ),
//                           Text(
//                             '\S' + ' ' + cartData.price.toStringAsFixed(2),
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 5,
//                                 color: Colors.yellow.shade900),
//                           ),
//                           // Text(
//                           //   'Size: ' + cartData.productSize,
//                           //   style: TextStyle(
//                           //       fontSize: 15,
//                           //       fontWeight: FontWeight.bold,
//                           //       letterSpacing: 5),
//                           // ),
//                           OutlinedButton(
//                             onPressed: null,
//                             child: Text(
//                               cartData.productSize,
//                             ),
//                           ),

//                           Row(
//                             children: [
//                               Container(
//                                 height: 40,
//                                 width: 170,
//                                 decoration: BoxDecoration(
//                                   color: Colors.red.shade400,
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     IconButton(
//                                       onPressed: cartData.quantity == 1
//                                           ? null
//                                           : () {
//                                               _cartProvider
//                                                   .decreement(cartData);
//                                             },
//                                       icon: Icon(
//                                         CupertinoIcons.minus,
//                                         color: Colors.white,
//                                         size: 15,
//                                       ),
//                                     ),
//                                     Text(
//                                       cartData.quantity.toString(),
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                     IconButton(
//                                       // onPressed: cartData.productQuantity ==
//                                       //         cartData.quantity
//                                       //     ? null
//                                       //  : () {
//                                       onPressed: () {
//                                         _cartProvider.increement(cartData);
//                                       },
//                                       icon: Icon(
//                                         CupertinoIcons.plus,
//                                         color: Colors.white,
//                                         size: 15,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               IconButton(
//                                 onPressed: () {
//                                   _cartProvider.removeItem(
//                                     cartData.productId,
//                                   );
//                                 },
//                                 icon: Icon(
//                                   CupertinoIcons.cart_badge_minus,
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           }),

//       // body:Center(
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //     children: [
//       //       Text('Your shopping cart is empty',
//       //       style:TextStyle(
//       //         fontSize: 22,
//       //         fontWeight: FontWeight.bold,
//       //         letterSpacing: 5,
//       //       ),
//       //       ),
//       //       SizedBox(height: 20,),
//       //       Container(
//       //         height: 40,
//       //         width: MediaQuery.of(context).size.width - 40,
//       //         decoration: BoxDecoration(
//       //           color:const Color.fromARGB(255, 13, 62, 86),
//       //           borderRadius: BorderRadius.circular(10),

//       //         ),
//       //         child: Center(
//       //           child: Text("Continue Shopping",
//       //           style: TextStyle(
//       //             fontSize: 19,
//       //             color:Colors.white,
//       //           ),),
//       //         ),
//       //       )
//       //     ],
//       //   ),
//       // ),
//       bottomSheet: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Container(
//               height: 50,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.red.shade400,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Text(
//                   '\$' +
//                       _cartProvider.totalPrice.toStringAsFixed(2) +
//                       "\n" +
//                       'CHECKOUT',
//                   style: TextStyle(
//                     color: Colors.white,
//                     letterSpacing: 8,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:multi_vendor_app/provider/cart_provider.dart';
//import 'package:multi_vendor_app/views/buyers/inner_screens/checkout_screen.dart';
import 'package:multi_vendor_app/views/buyers/innerscreens/check_out_screen.dart';

import 'package:multi_vendor_app/views/main_screen.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final CartProvider _cartProvider = Provider.of<CartProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey,
//         elevation: 0,
//         title: const Text(
//           'Cart Screen',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 4,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               _cartProvider.removeAllItem();
//             },
//             icon: Icon(
//               CupertinoIcons.delete,
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: _cartProvider.getCartItem.isNotEmpty
//                 ? ListView.builder(
//                     itemCount: _cartProvider.getCartItem.length,
//                     itemBuilder: (context, index) {
//                       final cartData =
//                           _cartProvider.getCartItem.values.toList()[index];
//                       return Card(
//                         child: SizedBox(
//                           height: 170,
//                           child: Row(
//                             children: [
//                               SizedBox(
//                                 height: 100,
//                                 width: 100,
//                                 child: Image.network(cartData.imageUrl[0]),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       cartData.productName,
//                                       style: const TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         letterSpacing: 5,
//                                       ),
//                                     ),
//                                     Text(
//                                       '\S ${cartData.price.toStringAsFixed(2)}',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         letterSpacing: 5,
//                                         color: Colors.yellow.shade900,
//                                       ),
//                                     ),
//                                     OutlinedButton(
//                                       onPressed: null,
//                                       child: Text(cartData.productSize),
//                                     ),
//                                     Row(
//                                       children: [
//                                         Container(
//                                           height: 30,
//                                           width: 170,
//                                           decoration: BoxDecoration(
//                                             color: Colors.red.shade400,
//                                           ),
//                                           child: Row(
//                                             children: [
//                                               IconButton(
//                                                 onPressed:
//                                                     cartData.quantity == 1
//                                                         ? null
//                                                         : () {
//                                                             _cartProvider
//                                                                 .decreaMent(
//                                                                     cartData);
//                                                           },
//                                                 icon: const Icon(
//                                                   CupertinoIcons.minus,
//                                                   color: Colors.white,
//                                                   size: 15,
//                                                 ),
//                                               ),
//                                               Text(
//                                                 cartData.quantity.toString(),
//                                                 style: const TextStyle(
//                                                     color: Colors.white),
//                                               ),
//                                               IconButton(
//                                                 onPressed: () {
//                                                   _cartProvider
//                                                       .increament(cartData);
//                                                 },
//                                                 icon: const Icon(
//                                                   CupertinoIcons.plus,
//                                                   color: Colors.white,
//                                                   size: 15,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         IconButton(
//                                           onPressed: () {
//                                             _cartProvider.removeItem(
//                                               cartData.productId,
//                                             );
//                                           },
//                                           icon: const Icon(
//                                             CupertinoIcons.cart_badge_minus,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   )
//                 : Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'Your shopping cart is empty',
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 5,
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Container(
//                           height: 40,
//                           width: MediaQuery.of(context).size.width - 40,
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 13, 62, 86),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               "Continue Shopping",
//                               style: TextStyle(
//                                 fontSize: 19,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 50,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.red.shade400,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Text(
//                   '\$${_cartProvider.totalPrice.toStringAsFixed(2)}\nCHECKOUT',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     letterSpacing: 8,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final CartProvider _cartProvider = Provider.of<CartProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.yellow.shade900,
//         elevation: 0,
//         title: Text(
//           'Cart Screen',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             letterSpacing: 4,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               _cartProvider.removeAllItem();
//             },
//             icon: Icon(
//               CupertinoIcons.delete,
//             ),
//           ),
//         ],
//       ),
//       body: _cartProvider.getCartItem.isNotEmpty
//           ? ListView.builder(
//               shrinkWrap: true,
//               itemCount: _cartProvider.getCartItem.length,
//               itemBuilder: (context, index) {
//                 final cartData =
//                     _cartProvider.getCartItem.values.toList()[index];
//                 return Card(
//                   child: SizedBox(
//                     height: 170,
//                     child: Row(children: [
//                       SizedBox(
//                         height: 100,
//                         width: 100,
//                         child: Image.network(cartData.imageUrl[0]),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               cartData.productName,
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 5,
//                               ),
//                             ),
//                             Text(
//                               '\$' + " " + cartData.price.toStringAsFixed(2),
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 5,
//                                 color: Colors.yellow.shade900,
//                               ),
//                             ),
//                             OutlinedButton(
//                               onPressed: null,
//                               child: Text(
//                                 cartData.productSize,
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 40,
//                                   width: 115,
//                                   decoration: BoxDecoration(
//                                     color: Colors.yellow.shade900,
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       IconButton(
//                                         onPressed: cartData.quantity == 1
//                                             ? null
//                                             : () {
//                                                 _cartProvider
//                                                     .decreaMent(cartData);
//                                               },
//                                         icon: Icon(
//                                           CupertinoIcons.minus,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       Text(
//                                         cartData.quantity.toString(),
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                       IconButton(
//                                           onPressed: cartData.productQuantity ==
//                                                   cartData.quantity
//                                               ? null
//                                               : () {
//                                                   _cartProvider
//                                                       .increament(cartData);
//                                                 },
//                                           icon: Icon(
//                                             CupertinoIcons.plus,
//                                             color: Colors.white,
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     _cartProvider.removeItem(
//                                       cartData.productId,
//                                     );
//                                   },
//                                   icon: Icon(
//                                     CupertinoIcons.cart_badge_minus,
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ]),
//                   ),
//                 );
//               })
//           : Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Your Shopping Cart is Empty',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 5,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) {
//                         return MainScreen();
//                       }));
//                     },
//                     child: Container(
//                       height: 40,
//                       width: MediaQuery.of(context).size.width - 40,
//                       decoration: BoxDecoration(
//                         color: Colors.yellow.shade900,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'CONTINUE SHOPPING',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//       bottomSheet: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: InkWell(
//           onTap: _cartProvider.totalPrice == 0.00
//               ? null
//               : () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return CheckoutScreen();
//                   }));
//                 },
//           child: Container(
//             height: 50,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: _cartProvider.totalPrice == 0.00
//                   ? Colors.grey
//                   : Colors.yellow.shade900,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Center(
//               child: Text(
//                 "\$" +
//                     _cartProvider.totalPrice.toStringAsFixed(2) +
//                     " " +
//                     'CHECKOUT',
//                 style: TextStyle(
//                   color: Colors.white,
//                   letterSpacing: 8,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
// //   }
// // }
// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final _cartProvider = context.read<CartNotifier>();  // Use read to access the cartNotifier

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.yellow.shade900,
//         elevation: 0,
//         title: Text(
//           'Cart Screen',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             letterSpacing: 4,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               _cartProvider.removeAllItem();
//             },
//             icon: Icon(
//               CupertinoIcons.delete,
//             ),
//           ),
//         ],
//       ),
//       body: _cartProvider.getCartItems.isNotEmpty
//           ? ListView.builder(
//               shrinkWrap: true,
//               itemCount: _cartProvider.getCartItems.length,
//               itemBuilder: (context, index) {
//                 final cartData = _cartProvider.getCartItems.values.toList()[index];
//                 return Card(
//                   child: SizedBox(
//                     height: 170,
//                     child: Row(children: [
//                       SizedBox(
//                         height: 100,
//                         width: 100,
//                         child: Image.network(cartData.imageUrl[0]),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               cartData.productName,
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 5,
//                               ),
//                             ),
//                             Text(
//                               '\$' + " " + cartData.productPrice.toStringAsFixed(2),
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 5,
//                                 color: Colors.yellow.shade900,
//                               ),
//                             ),
//                             OutlinedButton(
//                               onPressed: null,
//                               child: Text(
//                                 cartData.productSize,
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 40,
//                                   width: 115,
//                                   decoration: BoxDecoration(
//                                     color: Colors.yellow.shade900,
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       IconButton(
//                                         onPressed: cartData.quantity == 1
//                                             ? null
//                                             : () {
//                                                 _cartProvider.decrementItem(cartData.productId);
//                                               },
//                                         icon: Icon(
//                                           CupertinoIcons.minus,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       Text(
//                                         cartData.quantity.toString(),
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                       IconButton(
//                                           onPressed: cartData.quantity >= cartData.productQuantity
//                                               ? null
//                                               : () {
//                                                   _cartProvider.incrementItem(cartData.productId);
//                                                 },
//                                           icon: Icon(
//                                             CupertinoIcons.plus,
//                                             color: Colors.white,
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     _cartProvider.removeItem(cartData.productId);
//                                   },
//                                   icon: Icon(
//                                     CupertinoIcons.cart_badge_minus,
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ]),
//                   ),
//                 );
//               })
//           : Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Your Shopping Cart is Empty',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 5,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) {
//                         return MainScreen();
//                       }));
//                     },
//                     child: Container(
//                       height: 40,
//                       width: MediaQuery.of(context).size.width - 40,
//                       decoration: BoxDecoration(
//                         color: Colors.yellow.shade900,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'CONTINUE SHOPPING',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//       bottomSheet: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: InkWell(
//           onTap: _cartProvider.calculateTotalAmount() == 0.00
//               ? null
//               : () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return CheckoutScreen();
//                   }));
//                 },
//           child: Container(
//             height: 50,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: _cartProvider.calculateTotalAmount() == 0.00
//                   ? Colors.grey
//                   : Colors.yellow.shade900,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Center(
//               child: Text(
//                 "\$" +
//                     _cartProvider.calculateTotalAmount().toStringAsFixed(2) +
//                     " " +
//                     'CHECKOUT',
//                 style: TextStyle(
//                   color: Colors.white,
//                   letterSpacing: 8,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// // }
// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey,
//         elevation: 0,
//         title: const Text(
//           'Cart Screen',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 4,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               cartProvider.clearCart();
//             },
//             icon: const Icon(CupertinoIcons.delete),
//           ),
//         ],
//       ),
//       body: cartProvider.cartItems.isNotEmpty
//           ? Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cartProvider.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final cartItem = cartProvider.cartItems.values.toList()[index];
//                       final productId = cartProvider.cartItems.keys.toList()[index];
//                       return CartItemWidget(
//                         cartItem: cartItem,
//                         productId: productId,
//                         cartProvider: cartProvider,
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 50,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.red.shade400,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Text(
//                         '\$${cartProvider.totalPrice.toStringAsFixed(2)}\nCHECKOUT',
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           letterSpacing: 8,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           : const Center(
//               child: Text(
//                 'Your shopping cart is empty',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 5,
//                 ),
//               ),
//             ),
//     );
//   }
// }

// class CartItemWidget extends StatelessWidget {
//   final CartAttr cartItem;
//   final String productId;
//   final CartProvider cartProvider;

//   const CartItemWidget({
//     super.key,
//     required this.cartItem,
//     required this.productId,
//     required this.cartProvider,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: SizedBox(
//         height: 170,
//         child: Row(
//           children: [
//             SizedBox(
//               height: 100,
//               width: 100,
//               child: Image.network(cartItem.imageUrl[0]),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     cartItem.productName,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 5,
//                     ),
//                   ),
//                   Text(
//                     '\$${cartItem.price.toStringAsFixed(2)}',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 5,
//                       color: Colors.yellow.shade900,
//                     ),
//                   ),
//                   OutlinedButton(
//                     onPressed: null,
//                     child: Text(cartItem.productSize),
//                   ),
//                   Row(
//                     children: [
//                       IconButton(
//                         onPressed: cartItem.quantity == 1
//                             ? null
//                             : () => cartProvider.decrement(productId),
//                         icon: const Icon(
//                           CupertinoIcons.minus,
//                           color: Colors.white,
//                           size: 15,
//                         ),
//                       ),
//                       Text(
//                         cartItem.quantity.toString(),
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                       IconButton(
//                         onPressed: () => cartProvider.increment(productId),
//                         icon: const Icon(
//                           CupertinoIcons.plus,
//                           color: Colors.white,
//                           size: 15,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () => cartProvider.removeItem(productId),
//                         icon: const Icon(
//                           CupertinoIcons.cart_badge_minus,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CartScreen extends StatelessWidget {
//   const CartScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.yellow.shade900,
//         title: const Text(
//           'Cart',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 24,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () => cartProvider.clearCart(),
//             icon: const Icon(Icons.delete),
//           ),
//         ],
//       ),
//       body: cartProvider.cartItems.isNotEmpty
//           ? Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cartProvider.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final cartItem =
//                           cartProvider.cartItems.values.toList()[index];
//                       final productId =
//                           cartProvider.cartItems.keys.toList()[index];

//                       return CartItemWidget(
//                         cartItem: cartItem,
//                         productId: productId,
//                         cartProvider: cartProvider,
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Navigate to CheckoutScreen
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.yellow.shade900,
//                       minimumSize: const Size.fromHeight(50),
//                     ),
//                     child: Text(
//                       'Proceed to Checkout (\$${cartProvider.totalPrice.toStringAsFixed(2)})',
//                       style: const TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           : const Center(
//               child: Text(
//                 'Your cart is empty!',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//     );
//   }
// }

// class CartItemWidget extends StatelessWidget {
//   final CartAttr cartItem;
//   final String productId;
//   final CartProvider cartProvider;

//   const CartItemWidget({
//     Key? key,
//     required this.cartItem,
//     required this.productId,
//     required this.cartProvider,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8.0),
//       child: ListTile(
//         leading: Image.network(
//           cartItem.imageUrl.first,
//           fit: BoxFit.cover,
//         ),
//         title: Text(cartItem.productName),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Price: \$${cartItem.price.toStringAsFixed(2)}'),
//             Text('Size: ${cartItem.productSize}'),
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: cartItem.quantity > 1
//                       ? () => cartProvider.decrement(productId)
//                       : null,
//                   icon: const Icon(Icons.remove),
//                 ),
//                 Text('${cartItem.quantity}'),
//                 IconButton(
//                   onPressed: () =>
//                       cartProvider.increment(productId),
//                   icon: const Icon(Icons.add),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         trailing: IconButton(
//           icon: const Icon(Icons.delete),
//           onPressed: () => cartProvider.removeItem(productId),
//         ),
//       ),
//     );
//   }
// // }

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);
// FirebaseFirestore.instance
//         .collection('vendors')
//         .where('approved', isEqualTo: true)
//         .snapshots();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.yellow.shade900,
//         elevation: 0,
//         title: Text(
//           'My Cart',
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               cartProvider.clearCart();
//             },
//             icon: Icon(CupertinoIcons.delete),
//           ),
//         ],
//       ),
//       body:
//        cartProvider.cartItems.isNotEmpty
//           ? ListView.builder(
//               shrinkWrap: true,
//               itemCount: cartProvider.cartItems.length,
//               itemBuilder: (context, index) {
//                 final cartData = cartProvider.cartItems.values.toList()[index];
//                 return Card(
//                   child: SizedBox(
//                     height: 170,
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           height: 100,
//                           width: 100,
//                           child: Image.network(cartData.imageUrl[0]),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: SingleChildScrollView(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   cartData.productName,
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     letterSpacing: 5,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\$' + " " + cartData.price.toStringAsFixed(2),
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     letterSpacing: 5,
//                                     color: Colors.yellow.shade900,
//                                   ),
//                                 ),
//                                 OutlinedButton(
//                                   onPressed: null,
//                                   child: Text(cartData.productSize),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Container(
//                                       height: 40,
//                                       width: 115,
//                                       decoration: BoxDecoration(
//                                         color: Colors.yellow.shade900,
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           IconButton(
//                                             onPressed: cartData.quantity == 1
//                                                 ? null
//                                                 : () {
//                                                     cartProvider.decrement(
//                                                         cartData.productId);
//                                                   },
//                                             icon: Icon(
//                                               CupertinoIcons.minus,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                           Text(
//                                             cartData.quantity.toString(),
//                                             style: TextStyle(color: Colors.white),
//                                           ),
//                                           IconButton(
//                                             onPressed: cartData.productQuantity ==
//                                                     cartData.quantity
//                                                 ? null
//                                                 : () {
//                                                     cartProvider.increment(
//                                                         cartData.productId);
//                                                   },
//                                             icon: Icon(
//                                               CupertinoIcons.plus,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     IconButton(
//                                       onPressed: () {
//                                         cartProvider.removeItem(cartData.productId);
//                                       },
//                                       icon: Icon(CupertinoIcons.cart_badge_minus),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               })
//           : Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Your Shopping Cart is Empty',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 5,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   InkWell(
//                     onTap: () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) {
//                         return MainScreen();
//                       }));
//                     },
//                     child: Container(
//                       height: 40,
//                       width: MediaQuery.of(context).size.width - 40,
//                       decoration: BoxDecoration(
//                         color: Colors.yellow.shade900,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'CONTINUE SHOPPING',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//       bottomSheet: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: InkWell(
//           onTap: cartProvider.totalPrice == 0.00
//               ? null
//               : () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return CheckoutScreen();
//                   }));
//                 },
//           child: Container(
//             height: 50,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: cartProvider.totalPrice == 0.00
//                   ? Colors.grey
//                   : Colors.yellow.shade900,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Center(
//               child: Text(
//                 "\$" +
//                     cartProvider.totalPrice.toStringAsFixed(2) +
//                     " " +
//                     'CHECKOUT',
//                 style: TextStyle(
//                   color: Colors.white,
//                   letterSpacing: 8,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.yellow.shade900,
//         elevation: 0,
//         title: Text(
//           'Cart Screen',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             letterSpacing: 4,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               cartProvider.clearCart();
//             },
//             icon: Icon(CupertinoIcons.delete),
//           ),
//         ],
//       ),

//       body: cartProvider.cartItems.isNotEmpty
//           ? ListView.builder(
//               shrinkWrap: true,
//               itemCount: cartProvider.cartItems.length,
//               itemBuilder: (context, index) {
//                 final cartData = cartProvider.cartItems.values.toList()[index];
//                 return Card(
//                   child: SizedBox(
//                     height: 170,
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           height: 100,
//                           width: 100,
//                           child: Image.network(cartData.imageUrl[0]),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 cartData.productName,
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   letterSpacing: 5,
//                                 ),
//                               ),
//                               Text(
//                                 '\$' + " " + cartData.price.toStringAsFixed(2),
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   letterSpacing: 5,
//                                   color: Colors.yellow.shade900,
//                                 ),
//                               ),
//                               OutlinedButton(
//                                 onPressed: null,
//                                 child: Text(cartData.productSize),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   // Navigate to Store screen
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => StoreScreen(
//                                         storeName: cartData.storeName, // Pass store name
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 child: Text(
//                                   'Visit ${cartData.storeName}', // Display the store name
//                                   style: TextStyle(
//                                     color: Colors.blue,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Container(
//                                     height: 30,
//                                     width: 95,
//                                     decoration: BoxDecoration(
//                                       color: Colors.yellow.shade900,
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         IconButton(
//                                           onPressed: cartData.quantity == 1
//                                               ? null
//                                               : () {
//                                                   cartProvider.decrement(
//                                                       cartData.productId);
//                                                 },
//                                           icon: Icon(
//                                             CupertinoIcons.minus,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                         Text(
//                                           cartData.quantity.toString(),
//                                           style: TextStyle(color: Colors.white),
//                                         ),
//                                         IconButton(
//                                           onPressed: cartData.productQuantity ==
//                                                   cartData.quantity
//                                               ? null
//                                               : () {
//                                                   cartProvider.increment(
//                                                       cartData.productId);
//                                                 },
//                                           icon: Icon(
//                                             CupertinoIcons.plus,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   IconButton(
//                                     onPressed: () {
//                                       cartProvider.removeItem(cartData.productId);
//                                     },
//                                     icon: Icon(CupertinoIcons.cart_badge_minus),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               })
//           : Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Your Shopping Cart is Empty',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 5,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   InkWell(
//                     onTap: () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) {
//                         return MainScreen();
//                       }));
//                     },
//                     child: Container(
//                       height: 40,
//                       width: MediaQuery.of(context).size.width - 40,
//                       decoration: BoxDecoration(
//                         color: Colors.yellow.shade900,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'CONTINUE SHOPPING',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//       bottomSheet: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: InkWell(
//           onTap: cartProvider.totalPrice == 0.00
//               ? null
//               : () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return CheckoutScreen();
//                   }));
//                 },
//           child: Container(
//             height: 40,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: cartProvider.totalPrice == 0.00
//                   ? Colors.grey
//                   : Colors.yellow.shade900,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Center(
//               child: Text(
//                 "\$" +
//                     cartProvider.totalPrice.toStringAsFixed(2) +
//                     " " +
//                     'CHECKOUT',
//                 style: TextStyle(
//                   color: Colors.white,
//                   letterSpacing: 8,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);

//     FirebaseFirestore.instance
//         .collection('vendors')
//         .where('approved', isEqualTo: true)
//         .snapshots();

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.yellow.shade900,
//         elevation: 0,
//         title: Text(
//           'My Cart',
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               cartProvider.clearCart();
//             },
//             icon: Icon(CupertinoIcons.delete),
//           ),
//         ],
//       ),
//       body: cartProvider.cartItems.isNotEmpty
//           ? ListView.builder(
//               shrinkWrap: true,
//               itemCount: cartProvider.cartItems.length,
//               itemBuilder: (context, index) {
//                 final cartData = cartProvider.cartItems.values.toList()[index];
//                 return Card(
//                   child: SizedBox(
//                     height: 170,
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           height: 100,
//                           width: 100,
//                           child: Image.network(cartData.imageUrl[0]),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: SingleChildScrollView(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   cartData.productName,
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     letterSpacing: 5,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\$' + " " + cartData.price.toStringAsFixed(2),
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     letterSpacing: 5,
//                                     color: Colors.yellow.shade900,
//                                   ),
//                                 ),
//                                 OutlinedButton(
//                                   onPressed: null,
//                                   child: Text(cartData.productSize),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Container(
//                                       height: 40,
//                                       width: 115,
//                                       decoration: BoxDecoration(
//                                         color: Colors.yellow.shade900,
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           IconButton(
//                                             onPressed: cartData.quantity == 1
//                                                 ? null
//                                                 : () {
//                                                     cartProvider.decrement(
//                                                         cartData.productId);
//                                                   },
//                                             icon: Icon(
//                                               CupertinoIcons.minus,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                           Text(
//                                             cartData.quantity.toString(),
//                                             style: TextStyle(color: Colors.white),
//                                           ),
//                                           IconButton(
//                                             onPressed: cartData.productQuantity ==
//                                                     cartData.quantity
//                                                 ? null
//                                                 : () {
//                                                     cartProvider.increment(
//                                                         cartData.productId);
//                                                   },
//                                             icon: Icon(
//                                               CupertinoIcons.plus,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     IconButton(
//                                       onPressed: () {
//                                         cartProvider.removeItem(cartData.productId);
//                                       },
//                                       icon: Icon(CupertinoIcons.cart_badge_minus),
//                                     ),
//                                   ],
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () async {
//                                     // Add to orders and remove from cart
//                                     await cartProvider.placeOrder(cartData);
//                                     cartProvider.removeItem(cartData.productId);
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => CustomerOrderScreen(),
//                                       ),
//                                     );
//                                   },
//                                   child: Text('Proceed to Checkout'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               })
//           : Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Your Shopping Cart is Empty',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 5,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   InkWell(
//                     onTap: () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) {
//                         return MainScreen();
//                       }));
//                     },
//                     child: Container(
//                       height: 40,
//                       width: MediaQuery.of(context).size.width - 40,
//                       decoration: BoxDecoration(
//                         color: Colors.yellow.shade900,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'CONTINUE SHOPPING',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//       bottomSheet: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: InkWell(
//           onTap: cartProvider.totalPrice == 0.00
//               ? null
//               : () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return CheckoutScreen();
//                   }));
//                 },
//           child: Container(
//             height: 50,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: cartProvider.totalPrice == 0.00
//                   ? Colors.grey
//                   : Colors.yellow.shade900,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Center(
//               child: Text(
//                 "\$" +
//                     cartProvider.totalPrice.toStringAsFixed(2) +
//                     " " +
//                     'CHECKOUT',
//                 style: TextStyle(
//                   color: Colors.white,
//                   letterSpacing: 8,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    FirebaseFirestore.instance
        .collection('vendors')
        .where('approved', isEqualTo: true)
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade900,
        elevation: 0,
        title: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
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
      body: cartProvider.cartItems.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final cartData = cartProvider.cartItems.values.toList()[index];
                return Card(
                  child: SizedBox(
                    height: 170,
                    child: Row(
                      children: [
                        // Checkbox to select the product
                        Checkbox(
                          value: cartData.isSelected,
                          onChanged: (bool? value) {
                            if (value != null) {
                              if (value) {
                                cartProvider.selectProduct(cartData.productId);
                              } else {
                                cartProvider
                                    .deselectProduct(cartData.productId);
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(cartData.imageUrl[0]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartData.productName,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 5,
                                  ),
                                ),
                                Text(
                                  '\$' +
                                      " " +
                                      cartData.price.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 5,
                                    color: Colors.yellow.shade900,
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: null,
                                  child: Text(cartData.productSize),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 115,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow.shade900,
                                      ),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: cartData.quantity == 1
                                                ? null
                                                : () {
                                                    cartProvider.decrement(
                                                        cartData.productId);
                                                  },
                                            icon: Icon(
                                              CupertinoIcons.minus,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            cartData.quantity.toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          IconButton(
                                            onPressed:
                                                cartData.productQuantity ==
                                                        cartData.quantity
                                                    ? null
                                                    : () {
                                                        cartProvider.increment(
                                                            cartData.productId);
                                                      },
                                            icon: Icon(
                                              CupertinoIcons.plus,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        cartProvider
                                            .removeItem(cartData.productId);
                                      },
                                      icon:
                                          Icon(CupertinoIcons.cart_badge_minus),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Shopping Cart is Empty',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return MainScreen();
                      }));
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade900,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'CONTINUE SHOPPING',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
//         child: InkWell(
//           onTap: cartProvider.selectProduct.isEmpty
//               ? null
//               : () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return CheckoutScreen();
//                   }));
//                 },
//           child: Container(
//             height: 50,
//             width: double.infinity,
//             decoration: BoxDecoration(
//             color: cartProvider.selectedItemsTotalPrice == 0.00
//     ? Colors.grey
//     : Colors.yellow.shade900,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Center(
//               child: Text(
//                 "\$" +
//                     cartProvider.selectedItemsTotalPrice.toStringAsFixed(2) +
//                     " " +
//                     'CHECKOUT',
//                 style: TextStyle(
//                   color: Colors.white,
//                   letterSpacing: 8,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
        child: InkWell(
          onTap: cartProvider.cartItems.values
                  .any((cartItem) => cartItem.isSelected)
              ? () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CheckoutScreen();
                  }));
                }
              : null,
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: cartProvider.selectedItemsTotalPrice == 0.00
                  ? Colors.grey
                  : Colors.yellow.shade900,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "\$" +
                    cartProvider.selectedItemsTotalPrice.toStringAsFixed(2) +
                    " " +
                    'CHECKOUT',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 8,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
