// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:multi_vendor_app/models/cart_attributes.dart';
// import 'package:multi_vendor_app/models/items.dart';
// import 'package:multi_vendor_app/models/order.dart' as custom_order;

// class CartProvider with ChangeNotifier {
//   Map<String, CartAttr> _cartItems = {}; //stores added items
//   Map<String, CartAttr> get getCartItem {
//     return _cartItems;
//   }

//   List<custom_order.Order> _orders = [];

//   double get totalPrice {
//     var total = 0.0;
//     _cartItems.forEach(
//       (key, value) {
//         total += value.price * value.quantity;
//       },
//     );
//     return total;
//   }

//   void addProductToCart(
//     String productName,
//     String productId,
//     List imageUrl,
//     double price,
//     int quantity,
//     int productQuantity,
//     String vendorId,
//     String productSize,
//     Timestamp scheduleDate,
//   ) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//           productId,
//           (existingCart) => CartAttr(
//               productName: existingCart.productName,
//               productId: existingCart.productId,
//               imageUrl: existingCart.imageUrl,
//               quantity: existingCart.quantity + 1,
//               productQuantity: existingCart.productQuantity,
//               price: existingCart.price,
//               vendorId: existingCart.vendorId,
//               productSize: existingCart.productSize,
//               scheduleDate: existingCart.scheduleDate));
//       notifyListeners();
//     } else {
//       _cartItems.putIfAbsent(
//           productId,
//           () => CartAttr(
//               productName: productName,
//               productId: productId,
//               imageUrl: imageUrl,
//               quantity: quantity,
//               productQuantity: productQuantity,
//               price: price,
//               vendorId: vendorId,
//               productSize: productSize,
//               scheduleDate: scheduleDate));
//       notifyListeners();
//     }
//   }

//   void increement(CartAttr cartAttr) {
//     cartAttr.increase();
//     notifyListeners();
//   }

//   void decreement(CartAttr cartAttr) {
//     cartAttr.decrease();
//     notifyListeners();
//   }

//   removeItem(productId) {
//     _cartItems.remove(productId);
//     notifyListeners();
//   }

//   removeallItems() {
//     _cartItems.clear();
//     notifyListeners();
//   }

//   Future<void> addToOrders() async {
//     try {
//       // Assuming you have a method to get the current cart items
//       List<Item> cartItems = getCartItems();

//       // Create a new order with the cart items
//       custom_order.Order newOrder = custom_order.Order(
//         id: DateTime.now().millisecondsSinceEpoch.toString(),
//         items: cartItems,
//         totalPrice: totalPricefunc,
//         date: DateTime.now(),
//       );

//       // Add the new order to the orders list
//       _orders.add(newOrder);

//       // Clear the cart after adding to orders
//       clearCart();

//       // Notify listeners to update the UI
//       notifyListeners();
//     } catch (e) {
//       throw Exception("Failed to add to orders: $e");
//     }
//   }

//   List<Item> getCartItems() {
//     // Convert _cartItems (Map<String, CartAttr>) to a List<Item>
//     return _cartItems.entries.map((entry) {
//       final CartAttr cartAttr = entry.value;
//       return Item(
//         id: cartAttr.productId,
//         name: cartAttr.productName,
//         price: cartAttr.price,
//         quantity: cartAttr.quantity,
//       );
//     }).toList();
//   }

//   void clearCart() {
//     // Clear all items from the cart
//     _cartItems.clear();
//     notifyListeners(); // Notify listeners to update the UI
//   }

//   double get totalPricefunc {
//     // Calculate and return the total price of items in the cart
//     return _cartItems.values.fold(0.0, (total, cartAttr) {
//       return total + (cartAttr.price * cartAttr.quantity);
//     });
//   }
// }

//puja ko code

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:multi_vendor_app/models/cart_attributes.dart';

// class CartProvider with ChangeNotifier {
//   Map<String, CartAttr> _cartItems = {}; //stores added items
//   Map<String, CartAttr> get getCartItem {
//     return _cartItems;
//   }

//   double get totalPrice {
//     var total = 0.0;
//     _cartItems.forEach(
//       (key, value) {
//         total += value.price * value.quantity;
//       },
//     );
//     return total;
//   }

//   void addProductToCart(
//     String productName,
//     String productId,
//     List imageUrl,
//     double price,
//     int quantity,
//     int productQuantity,
//     String vendorId,
//     String productSize,
//     Timestamp scheduleDate,
//   ) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//           productId,
//           (existingCart) => CartAttr(
//               productName: existingCart.productName,
//               productId: existingCart.productId,
//               imageUrl: existingCart.imageUrl,
//               quantity: existingCart.quantity + 1,
//               productQuantity: existingCart.productQuantity,
//               price: existingCart.price,
//               vendorId: existingCart.vendorId,
//               productSize: existingCart.productSize,
//               scheduleDate: existingCart.scheduleDate));
//       notifyListeners();
//     } else {
//       _cartItems.putIfAbsent(
//           productId,
//           () => CartAttr(
//               productName: productName,
//               productId: productId,
//               imageUrl: imageUrl,
//               quantity: quantity,
//               productQuantity: productQuantity,
//               price: price,
//               vendorId: vendorId,
//               productSize: productSize,
//               scheduleDate: scheduleDate));
//       notifyListeners();
//     }
//   }

//   void increement(CartAttr cartAttr) {
//     cartAttr.increase();
//     notifyListeners();
//   }

//   void decreement(CartAttr cartAttr) {
//     cartAttr.decrease();
//     notifyListeners();
//   }

//   removeItem(productId) {
//     _cartItems.remove(productId);
//     notifyListeners();
//   }

//   removeallItems() {
//     _cartItems.clear();
//     notifyListeners();
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_vendor_app/models/cart_attributes.dart';

// class CartProvider with ChangeNotifier {
//   Map<String, CartAttr> _cartItems = {};

//   Map<String, CartAttr> get getCartItem {
//     return _cartItems;
//   }

//   double get totalPrice {
//     var total = 0.00;

//     _cartItems.forEach((key, value) {
//       total += value.price * value.quantity;
//     });

//     return total;
//   }

//   void addProductToCart(
//       String productName,
//       String productId,
//       List imageUrl,
//       int quantity,
//       int productQuantity,
//       double price,
//       String vendorId,
//       String productSize,
//       Timestamp scheduleDate) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//           productId,
//           (exitingCart) => CartAttr(
//               productName: exitingCart.productName,
//               productId: exitingCart.productId,
//               imageUrl: exitingCart.imageUrl,
//               quantity: exitingCart.quantity + 1,
//               productQuantity: exitingCart.productQuantity,
//               price: exitingCart.price,
//               vendorId: exitingCart.vendorId,
//               productSize: exitingCart.productSize,
//               scheduleDate: exitingCart.scheduleDate));

//       notifyListeners();
//     } else {
//       _cartItems.putIfAbsent(
//           productId,
//           () => CartAttr(
//               productName: productName,
//               productId: productId,
//               imageUrl: imageUrl,
//               quantity: quantity,
//               productQuantity: productQuantity,
//               price: price,
//               vendorId: vendorId,
//               productSize: productSize,
//               scheduleDate: scheduleDate));

//       notifyListeners();
//     }
//   }

//   void increament(CartAttr cartAttr) {
//     cartAttr.increase();

//     notifyListeners();
//   }

//   void decreaMent(CartAttr cartAttr) {
//     cartAttr.decrease();

//     notifyListeners();
//   }

//   removeItem(productId) {
//     _cartItems.remove(productId);

//     notifyListeners();
//   }

//   removeAllItem() {
//     _cartItems.clear();

//     notifyListeners();
//   }
// // }
// class CartProvider with ChangeNotifier {
//   final Map<String, CartAttr> _cartItems = {};

//   Map<String, CartAttr> get cartItems => _cartItems;

//   double get totalPrice {
//     double total = 0.0;
//     _cartItems.forEach((key, value) {
//       total += value.price * value.quantity;
//     });
//     return total;
//   }

//   get getCartItem => null;

//   void addProductToCart(
//     String productName,
//     String productId,
//     List imageUrl,
//     int quantity,
//     int productQuantity,
//     double price,
//     String vendorId,
//     String productSize,
//     Timestamp scheduleDate,
//   ) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//         productId,
//         (existingCartItem) => CartAttr(
//           productName: existingCartItem.productName,
//           productId: existingCartItem.productId,
//           imageUrl: existingCartItem.imageUrl,
//           quantity: existingCartItem.quantity + 1,
//           productQuantity: existingCartItem.productQuantity,
//           price: existingCartItem.price,
//           vendorId: existingCartItem.vendorId,
//           productSize: existingCartItem.productSize,
//           scheduleDate: existingCartItem.scheduleDate,
//         ),
//       );
//     } else {
//       _cartItems[productId] = CartAttr(
//         productName: productName,
//         productId: productId,
//         imageUrl: imageUrl,
//         quantity: quantity,
//         productQuantity: productQuantity,
//         price: price,
//         vendorId: vendorId,
//         productSize: productSize,
//         scheduleDate: scheduleDate,
//       );
//     }
//     notifyListeners();
//   }

//   void increment(String productId) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//         productId,
//         (existingCartItem) => CartAttr(
//           productName: existingCartItem.productName,
//           productId: existingCartItem.productId,
//           imageUrl: existingCartItem.imageUrl,
//           quantity: existingCartItem.quantity + 1,
//           productQuantity: existingCartItem.productQuantity,
//           price: existingCartItem.price,
//           vendorId: existingCartItem.vendorId,
//           productSize: existingCartItem.productSize,
//           scheduleDate: existingCartItem.scheduleDate,
//         ),
//       );
//       notifyListeners();
//     }
//   }

//   void decrement(String productId) {
//     if (_cartItems.containsKey(productId)) {
//       final currentQuantity = _cartItems[productId]!.quantity;
//       if (currentQuantity > 1) {
//         _cartItems.update(
//           productId,
//           (existingCartItem) => CartAttr(
//             productName: existingCartItem.productName,
//             productId: existingCartItem.productId,
//             imageUrl: existingCartItem.imageUrl,
//             quantity: currentQuantity - 1,
//             productQuantity: existingCartItem.productQuantity,
//             price: existingCartItem.price,
//             vendorId: existingCartItem.vendorId,
//             productSize: existingCartItem.productSize,
//             scheduleDate: existingCartItem.scheduleDate,
//           ),
//         );
//         notifyListeners();
//       }
//     }
//   }

//   void removeItem(String productId) {
//     _cartItems.remove(productId);
//     notifyListeners();
//   }

//   void clearCart() {
//     _cartItems.clear();
//     notifyListeners();
//   }

//   void removeAllItem() {}
// // }
// class CartProvider with ChangeNotifier {
//   final Map<String, CartAttr> _cartItems = {};

//   Map<String, CartAttr> get cartItems => _cartItems;

//   double get totalPrice {
//     double total = 0.0;
//     _cartItems.forEach((key, value) {
//       total += value.price * value.quantity;
//     });
//     return total;
//   }

//   // Add product to cart
//   void addProductToCart(
//     String productName,
//     String productId,
//     List imageUrl,
//     double price,
//     int quantity,
//     int productQuantity,
//     String vendorId,
//     String productSize,
//     Timestamp scheduleDate,
//   ) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//         productId,
//         (existingCartItem) => CartAttr(
//           productName: existingCartItem.productName,
//           productId: existingCartItem.productId,
//           imageUrl: existingCartItem.imageUrl,
//           quantity: existingCartItem.quantity + 1,
//           productQuantity: existingCartItem.productQuantity,
//           price: existingCartItem.price,
//           vendorId: existingCartItem.vendorId,
//           productSize: existingCartItem.productSize,
//           scheduleDate: existingCartItem.scheduleDate,
//         ),
//       );
//     } else {
//       _cartItems[productId] = CartAttr(
//         productName: productName,
//         productId: productId,
//         imageUrl: imageUrl,
//         quantity: quantity,
//         productQuantity: productQuantity,
//         price: price,
//         vendorId: vendorId,
//         productSize: productSize,
//         scheduleDate: scheduleDate,
//       );
//     }
//     notifyListeners();
//   }

//   void increment(String productId) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//         productId,
//         (existingCartItem) => CartAttr(
//           productName: existingCartItem.productName,
//           productId: existingCartItem.productId,
//           imageUrl: existingCartItem.imageUrl,
//           quantity: existingCartItem.quantity + 1,
//           productQuantity: existingCartItem.productQuantity,
//           price: existingCartItem.price,
//           vendorId: existingCartItem.vendorId,
//           productSize: existingCartItem.productSize,
//           scheduleDate: existingCartItem.scheduleDate,
//         ),
//       );
//       notifyListeners();
//     }
//   }

//   void decrement(String productId) {
//     if (_cartItems.containsKey(productId)) {
//       final currentQuantity = _cartItems[productId]!.quantity;
//       if (currentQuantity > 1) {
//         _cartItems.update(
//           productId,
//           (existingCartItem) => CartAttr(
//             productName: existingCartItem.productName,
//             productId: existingCartItem.productId,
//             imageUrl: existingCartItem.imageUrl,
//             quantity: currentQuantity - 1,
//             productQuantity: existingCartItem.productQuantity,
//             price: existingCartItem.price,
//             vendorId: existingCartItem.vendorId,
//             productSize: existingCartItem.productSize,
//             scheduleDate: existingCartItem.scheduleDate,
//           ),
//         );
//         notifyListeners();
//       }
//     }
//   }

//   void removeItem(String productId) {
//     _cartItems.remove(productId);
//     notifyListeners();
//   }

//   void clearCart() {
//     _cartItems.clear();
//     notifyListeners();
//   }
// // }
// class CartProvider with ChangeNotifier {
//   final Map<String, CartAttr> _cartItems = {};

//   Map<String, CartAttr> get cartItems => _cartItems;

//   double get totalPrice {
//     double total = 0.0;
//     _cartItems.forEach((key, value) {
//       total += value.price * value.quantity;
//     });
//     return total;
//   }

//   void addProductToCart(
//     String productName,
//     String productId,
//     List imageUrl,
//     double price,
//     int quantity,
//     int productQuantity,
//     String vendorId,
//     String productSize,
//     Timestamp scheduleDate,
//   ) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//         productId,
//         (existingCartItem) => CartAttr(
//            businessName: existingCartItem.businessName,
//           productName: existingCartItem.productName,
//           productId: existingCartItem.productId,
//           imageUrl: existingCartItem.imageUrl,
//           quantity: existingCartItem.quantity + 1,
//           productQuantity: existingCartItem.productQuantity,
//           price: existingCartItem.price,
//           vendorId: existingCartItem.vendorId,
//           productSize: existingCartItem.productSize,
//           scheduleDate: existingCartItem.scheduleDate,
//         ),
//       );
//     } else {
//       _cartItems[productId] = CartAttr(
//         productName: productName,
//         productId: productId,
//         imageUrl: imageUrl,
//         quantity: quantity,
//         productQuantity: productQuantity,
//         price: price,
//         vendorId: vendorId,
//         productSize: productSize,
//         scheduleDate: scheduleDate, businessName: '',
//       );
//     }
//     notifyListeners();
//   }

//   // void increment(String productId) {
//   //   if (_cartItems.containsKey(productId)) {
//   //     _cartItems.update(
//   //       productId,
//   //       (existingCartItem) => CartAttr(
//   //         productName: existingCartItem.productName,
//   //         productId: existingCartItem.productId,
//   //         imageUrl: existingCartItem.imageUrl,
//   //         quantity: existingCartItem.quantity + 1,
//   //         productQuantity: existingCartItem.productQuantity,
//   //         price: existingCartItem.price,
//   //         vendorId: existingCartItem.vendorId,
//   //         productSize: existingCartItem.productSize,
//   //         scheduleDate: existingCartItem.scheduleDate,
//   //       ),
//   //     );
//   //     notifyListeners();
//   //   }
//   // }

//   // void decrement(String productId) {
//   //   if (_cartItems.containsKey(productId)) {
//   //     final currentQuantity = _cartItems[productId]!.quantity;
//   //     if (currentQuantity > 1) {
//   //       _cartItems.update(
//   //         productId,
//   //         (existingCartItem) => CartAttr(
//   //           productName: existingCartItem.productName,
//   //           productId: existingCartItem.productId,
//   //           imageUrl: existingCartItem.imageUrl,
//   //           quantity: currentQuantity - 1,
//   //           productQuantity: existingCartItem.productQuantity,
//   //           price: existingCartItem.price,
//   //           vendorId: existingCartItem.vendorId,
//   //           productSize: existingCartItem.productSize,
//   //           scheduleDate: existingCartItem.scheduleDate,
//   //         ),
//   //       );
//   //       notifyListeners();
//   //     }
//   //   }
//   // }

//   void removeItem(String productId) {
//     _cartItems.remove(productId);
//     notifyListeners();
//   }

//   void clearCart() {
//     _cartItems.clear();
//     notifyListeners();
//   }

//   void decrement(String productId) {}

//   void increment(String productId) {}
// // }
// class CartProvider with ChangeNotifier {
//   final Map<String, CartAttr> _cartItems = {};

//   Map<String, CartAttr> get cartItems => _cartItems;

//   double get totalPrice {
//     double total = 0.0;
//     _cartItems.forEach((key, value) {
//       total += value.price * value.quantity;
//     });
//     return total;
//   }

//   void addProductToCart(
//     String productName,
//     String productId,
//     List imageUrl,
//     double price,
//     int quantity,
//     int productQuantity,
//     String vendorId,
//     String productSize,
//     Timestamp scheduleDate,
//   ) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//         productId,
//         (existingCartItem) => CartAttr(
//           bussinessName: existingCartItem.bussinessName,
//           productName: existingCartItem.productName,
//           productId: existingCartItem.productId,
//           imageUrl: existingCartItem.imageUrl,
//           quantity: existingCartItem.quantity + 1,
//           productQuantity: existingCartItem.productQuantity,
//           price: existingCartItem.price,
//           vendorId: existingCartItem.vendorId,
//           productSize: existingCartItem.productSize,
//           scheduleDate: existingCartItem.scheduleDate,
//         ),
//       );
//     } else {
//       _cartItems[productId] = CartAttr(
//         productName: productName,
//         productId: productId,
//         imageUrl: imageUrl,
//         quantity: quantity,
//         productQuantity: productQuantity,
//         price: price,
//         vendorId: vendorId,
//         productSize: productSize,
//         scheduleDate: scheduleDate,
//         bussinessName: '',
//       );
//     }
//     notifyListeners();
//   }

//   void increment(String productId) {
//     if (_cartItems.containsKey(productId)) {
//       final existingCartItem = _cartItems[productId];
//       if (existingCartItem != null &&
//           existingCartItem.quantity < existingCartItem.productQuantity) {
//         _cartItems.update(
//           productId,
//           (existingCartItem) => CartAttr(
//             bussinessName: existingCartItem.bussinessName,
//             productName: existingCartItem.productName,
//             productId: existingCartItem.productId,
//             imageUrl: existingCartItem.imageUrl,
//             quantity: existingCartItem.quantity + 1,
//             productQuantity: existingCartItem.productQuantity,
//             price: existingCartItem.price,
//             vendorId: existingCartItem.vendorId,
//             productSize: existingCartItem.productSize,
//             scheduleDate: existingCartItem.scheduleDate,
//           ),
//         );
//         notifyListeners();
//       }
//     }
//   }

//   void decrement(String productId) {
//     if (_cartItems.containsKey(productId)) {
//       final existingCartItem = _cartItems[productId];
//       if (existingCartItem != null && existingCartItem.quantity > 1) {
//         _cartItems.update(
//           productId,
//           (existingCartItem) => CartAttr(
//             bussinessName: existingCartItem.bussinessName,
//             productName: existingCartItem.productName,
//             productId: existingCartItem.productId,
//             imageUrl: existingCartItem.imageUrl,
//             quantity: existingCartItem.quantity - 1,
//             productQuantity: existingCartItem.productQuantity,
//             price: existingCartItem.price,
//             vendorId: existingCartItem.vendorId,
//             productSize: existingCartItem.productSize,
//             scheduleDate: existingCartItem.scheduleDate,
//           ),
//         );
//         notifyListeners();
//       }
//     }
//   }

//   void removeItem(String productId) {
//     _cartItems.remove(productId);
//     notifyListeners();
//   }

//   void clearCart() {
//     _cartItems.clear();
//     notifyListeners();
//   }
// }
import 'package:flutter/foundation.dart'; // Ensure this import is present for ChangeNotifier

class CartProvider with ChangeNotifier {
  final Map<String, CartAttr> _cartItems = {}; // This is your cart items map
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

  Map<String, CartAttr> get cartItems => _cartItems;
  double get totalPrice {
    double total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  // Select product for checkout
  void selectProduct(String productId) {
    if (_cartItems.containsKey(productId)) {
      final existingCartItem = _cartItems[productId];
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttr(
          bussinessName: existingCartItem.bussinessName,
          productName: existingCartItem.productName,
          productId: existingCartItem.productId,
          imageUrl: existingCartItem.imageUrl,
          quantity: existingCartItem.quantity,
          productQuantity: existingCartItem.productQuantity,
          price: existingCartItem.price,
          vendorId: existingCartItem.vendorId,
          productSize: existingCartItem.productSize,
          scheduleDate: existingCartItem.scheduleDate,
          isSelected: true, // Mark as selected
        ),
      );
      notifyListeners();
    }
  }

  // Deselect product for checkout
  void deselectProduct(String productId) {
    if (_cartItems.containsKey(productId)) {
      final existingCartItem = _cartItems[productId];
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttr(
          bussinessName: existingCartItem.bussinessName,
          productName: existingCartItem.productName,
          productId: existingCartItem.productId,
          imageUrl: existingCartItem.imageUrl,
          quantity: existingCartItem.quantity,
          productQuantity: existingCartItem.productQuantity,
          price: existingCartItem.price,
          vendorId: existingCartItem.vendorId,
          productSize: existingCartItem.productSize,
          scheduleDate: existingCartItem.scheduleDate,
          isSelected: false, // Mark as deselected
        ),
      );
      notifyListeners();
    }
  }

  // Method to fetch and load cart from Firestore when the user logs in
  Future<void> loadCartFromFirestore() async {
    try {
      final cartSnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('cart')
          .get();

      cartSnapshot.docs.forEach((doc) {
        final data = doc.data();
        _cartItems[doc.id] = CartAttr.fromFirestore(
            data); // Make sure CartAttr has a fromFirestore method
      });
      notifyListeners();
    } catch (e) {
      print('Error loading cart: $e');
    }
  }

  // Save the cart to Firestore
  Future<void> saveCartToFirestore() async {
    try {
      for (var productId in _cartItems.keys) {
        final cartItem = _cartItems[productId];
        if (cartItem != null) {
          await _firestore
              .collection('users')
              .doc(userId)
              .collection('cart')
              .doc(productId)
              .set(cartItem.toMap()); // Make sure CartAttr has a toMap method
        }
      }
    } catch (e) {
      print('Error saving cart: $e');
    }
  }

  // Add product to cart
  void addProductToCart(
    String productName,
    String productId,
    List imageUrl,
    double price,
    int quantity,
    int productQuantity,
    String vendorId,
    String productSize,
    Timestamp scheduleDate,
  ) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttr(
          bussinessName: existingCartItem.bussinessName,
          productName: existingCartItem.productName,
          productId: existingCartItem.productId,
          imageUrl: existingCartItem.imageUrl,
          quantity: existingCartItem.quantity + 1,
          productQuantity: existingCartItem.productQuantity,
          price: existingCartItem.price,
          vendorId: existingCartItem.vendorId,
          productSize: existingCartItem.productSize,
          scheduleDate: existingCartItem.scheduleDate,
        ),
      );
    } else {
      _cartItems[productId] = CartAttr(
        productName: productName,
        productId: productId,
        imageUrl: imageUrl,
        quantity: quantity,
        productQuantity: productQuantity,
        price: price,
        vendorId: vendorId,
        productSize: productSize,
        scheduleDate: scheduleDate,
        bussinessName: '',
      );
    }
    saveCartToFirestore(); // Save cart after modification
    notifyListeners();
  }

  Future<void> placeOrder(CartAttr cartData) async {
    final user = FirebaseAuth.instance.currentUser;
    // Filter the selected products
    final selectedItems =
        _cartItems.values.where((cartItem) => cartItem.isSelected).toList();
    // Add to the orders collection
    for (var cartData in selectedItems) {
      // Add to the orders collection
      await FirebaseFirestore.instance.collection('orders').add({
        'buyerId': user!.uid,
        'productId': cartData.productId,
        'productName': cartData.productName,
        'productPrice': cartData.price,
        'quantity': cartData.quantity,
        'productImage': cartData.imageUrl,
        'orderDate': Timestamp.now(),
        'scheduleDate': cartData.scheduleDate,
        'accepted': false, // Or based on your logic
      });
    }
    // Optionally show a confirmation or update state
    notifyListeners();
  }

  // Similar changes for increment, decrement, removeItem, etc.
  double get selectedItemsTotalPrice {
    double total = 0.0;
    _cartItems.forEach((key, cartItem) {
      if (cartItem.isSelected) {
        total += cartItem.price * cartItem.quantity;
      }
    });
    return total;
  }

  void increment(String productId) {
    if (_cartItems.containsKey(productId)) {
      final existingCartItem = _cartItems[productId];
      if (existingCartItem != null &&
          existingCartItem.quantity < existingCartItem.productQuantity) {
        _cartItems.update(
          productId,
          (existingCartItem) => CartAttr(
            bussinessName: existingCartItem.bussinessName,
            productName: existingCartItem.productName,
            productId: existingCartItem.productId,
            imageUrl: existingCartItem.imageUrl,
            quantity: existingCartItem.quantity + 1,
            productQuantity: existingCartItem.productQuantity,
            price: existingCartItem.price,
            vendorId: existingCartItem.vendorId,
            productSize: existingCartItem.productSize,
            scheduleDate: existingCartItem.scheduleDate,
          ),
        );
        notifyListeners();
      }
    }
  }

  void decrement(String productId) {
    if (_cartItems.containsKey(productId)) {
      final existingCartItem = _cartItems[productId];
      if (existingCartItem != null && existingCartItem.quantity > 1) {
        _cartItems.update(
          productId,
          (existingCartItem) => CartAttr(
            bussinessName: existingCartItem.bussinessName,
            productName: existingCartItem.productName,
            productId: existingCartItem.productId,
            imageUrl: existingCartItem.imageUrl,
            quantity: existingCartItem.quantity - 1,
            productQuantity: existingCartItem.productQuantity,
            price: existingCartItem.price,
            vendorId: existingCartItem.vendorId,
            productSize: existingCartItem.productSize,
            scheduleDate: existingCartItem.scheduleDate,
          ),
        );
        notifyListeners();
      }
    }
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
