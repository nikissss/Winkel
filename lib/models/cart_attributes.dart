// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';

// class CartAttr with ChangeNotifier {
//   final String productName;
//   final String productId;
//   final List imageUrl;
//   int quantity;
//   int productQuantity;
//   final double price;
//   final String vendorId;
//   final String productSize;
//   Timestamp scheduleDate;

//   CartAttr(
//       {required this.productName,
//       required this.productId,
//       required this.imageUrl,
//       required this.quantity,
//       required this.productQuantity,
//       required this.price,
//       required this.vendorId,
//       required this.productSize,
//       required this.scheduleDate});

//   void increase() {
//     quantity++;
//   }

//   void decrease() {
//     quantity--;
//   }
// }

//puja ko code

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';

// class CartAttr with ChangeNotifier {
//   final String productName;
//   final String productId;
//   final List imageUrl;
//   int quantity;
//   int productQuantity;
//   final double price;
//   final String vendorId;
//   final String productSize;
//   Timestamp scheduleDate;

//   CartAttr(
//       {required this.productName,
//       required this.productId,
//       required this.imageUrl,
//       required this.quantity,
//       required this.productQuantity,
//       required this.price,
//       required this.vendorId,
//       required this.productSize,
//       required this.scheduleDate});

//   void increase() {
//     quantity++;
//   }

//   void decrease() {
//     quantity--;
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

// class CartAttr with ChangeNotifier {
//   final String productName;

//   final String productId;

//   final List imageUrl;

//   int quantity;

//   int productQuantity;

//   final double price;

//   final String vendorId;

//   final String productSize;

//   Timestamp scheduleDate;
//   final String storeName;

//   CartAttr(this.businessName,
//       {required this.productName,
//       required this.productId,
//       required this.imageUrl,
//       required this.quantity,

//       required this.productQuantity,
//       required this.price,
//       required this.vendorId,
//       required this.productSize,
//       required this.scheduleDate,
//       });

//   void increase() {
//     quantity++;
//   }

//   void decrease() {
//     quantity--;
//   }
// }

// class CartAttr with ChangeNotifier {
//   final String productName;
//   final String productId;
//   final List imageUrl;
//   int quantity;
//   int productQuantity;
//   final double price;
//   final String vendorId;
//   final String productSize;
//   Timestamp scheduleDate;
//   final String bussinessName;  // Keep storeName as a required parameter

//   CartAttr({
//     required this.bussinessName,  // Store name as a named parameter
//     required this.productName,
//     required this.productId,
//     required this.imageUrl,
//     required this.quantity,
//     required this.productQuantity,
//     required this.price,
//     required this.vendorId,
//     required this.productSize,
//     required this.scheduleDate,
//   });

//   get vendorName => null;

//   void increase() {
//     quantity++;
//   }

//   void decrease() {
//     quantity--;
//   }
// }
class CartAttr {
  final String productName;
  final String productId;
  final List imageUrl;
  final int quantity;
  final int productQuantity;
  final double price;
  final String vendorId;
  final String productSize;
  final Timestamp scheduleDate;
  final String bussinessName;
  bool isSelected;

  CartAttr({
    required this.productName,
    required this.productId,
    required this.imageUrl,
    required this.quantity,
    required this.productQuantity,
    required this.price,
    required this.vendorId,
    required this.productSize,
    required this.scheduleDate,
    required this.bussinessName,
    this.isSelected = false,
  });

  // Convert Firestore document to CartAttr
  factory CartAttr.fromFirestore(Map<String, dynamic> data) {
    return CartAttr(
      productName: data['productName'],
      productId: data['productId'],
      imageUrl: List.from(data['imageUrl']),
      quantity: data['quantity'],
      productQuantity: data['productQuantity'],
      price: data['price'],
      vendorId: data['vendorId'],
      productSize: data['productSize'],
      scheduleDate: data['scheduleDate'],
      bussinessName: data['bussinessName'],
      isSelected: data['isSelected'] ?? false,
    );
  }

  // Convert CartAttr to map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productId': productId,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'productQuantity': productQuantity,
      'price': price,
      'vendorId': vendorId,
      'productSize': productSize,
      'scheduleDate': scheduleDate,
      'bussinessName': bussinessName,
      'isSelected': isSelected,
    };
  }

  // Methods for changing quantity (returning a new instance with updated quantity)
  CartAttr increase() {
    return CartAttr(
      bussinessName: bussinessName,
      productName: productName,
      productId: productId,
      imageUrl: imageUrl,
      quantity: quantity + 1,
      productQuantity: productQuantity,
      price: price,
      vendorId: vendorId,
      productSize: productSize,
      scheduleDate: scheduleDate,
    );
  }

  CartAttr decrease() {
    return CartAttr(
      bussinessName: bussinessName,
      productName: productName,
      productId: productId,
      imageUrl: imageUrl,
      quantity: quantity - 1,
      productQuantity: productQuantity,
      price: price,
      vendorId: vendorId,
      productSize: productSize,
      scheduleDate: scheduleDate,
    );
  }
}
