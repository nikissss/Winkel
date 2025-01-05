// import 'package:flutter/material.dart';

// // purpose :this class will be used to manage and notify listners about the change
// class ProductProvider extends ChangeNotifier {
//   /// this map will store the product rel;ated information
//   Map<String, dynamic> productData = {};

// // this method will be use to update product relate fields

//   getFormData({
//     String? productName,
//     double? productPrice,
//     int? quantity,
//     String? category,
//     String? description,
//     DateTime? scheduleDate,
//     List<String>? imageUrlList,
//     bool? chargeShipping,
//     int? shippingCharge,
//     String? brandName,
//     List<String>? sizeList,
//   }) {
//     // check if product name is not null
//     // purpose: ensure that only non null values where added
//     if (productName != null) {
//       productData['productName'] = productName;
//     }
//     if (productPrice != null) {
//       productData['productPrice'] = productPrice;
//     }
//     if (quantity != null) {
//       productData['quantity'] = quantity;
//     }
//     if (category != null) {
//       productData['category'] = category;
//     }
//     if (description != null) {
//       productData['description'] = description;
//     }
//     if (scheduleDate != null) {
//       productData['scheduleDate'] = scheduleDate;
//     }
//     if (imageUrlList != null) {
//       productData['imageUrlList'] = imageUrlList;
//     }
//     if (chargeShipping != null) {
//       productData['chargeShipping'] = chargeShipping;
//     }
//     if (shippingCharge != null) {
//       productData['shippingCharge'] = shippingCharge;
//     }
//     if (brandName != null) {
//       productData['brandName'] = brandName;
//     }
//     if (sizeList != null) {
//       productData['sizeList'] = sizeList;
//     }
// //listening to the changes that we made
//     notifyListeners();
//   }

//   clearData() {
//     productData.clear();
//     notifyListeners();
//   }
// }

//puja ko code
// import 'package:flutter/material.dart';
// // purpose :this class will be used to manage and notify listners about the change
// class  ProductProvider extends ChangeNotifier {
// /// this map will store the product rel;ated information
// Map<String, dynamic> productData = {};

// // this method will be use to update product relate fields

// getFormData({
//   String? productName,
// double? productPrice,
//  int? quantity,
//  String? category,
//  String? description ,
//  DateTime ? scheduleDate,
//  List <String>? imageUrlList,
//  bool? chargeShipping,
//  int? shippingCharge,
//  String? brandName,
//  List <String>? sizeList,
//  }){
//   // check if product name is not null
//    // purpose: ensure that only non null values where added
//    if(productName!=null){
//     productData['productName'] = productName;
//    }
//    if(productPrice!=null){
//         productData['productPrice'] = productPrice;
//    }
//    if(quantity!=null){
//         productData['quantity'] = quantity;
//    }
//    if(category!=null){
//         productData['category'] = category;
//    }
//     if(description!=null){
//         productData['description'] = description;
//    }
//    if(scheduleDate!=null){
//         productData['scheduleDate'] = scheduleDate;
//    }
//       if(imageUrlList!=null){
//         productData['imageUrlList'] = imageUrlList;
//    }
//     if(chargeShipping!=null){
//         productData['chargeShipping'] = chargeShipping;
//    }
//    if(shippingCharge!=null){
//         productData['shippingCharge'] =shippingCharge;
//    }
//    if(brandName!=null){
//         productData['brandName'] =brandName;
//    }
//    if(sizeList!=null){
//         productData['sizeList'] =sizeList;
//    }
// //listening to the changes that we made
//    notifyListeners();
// }

// clearData(){
//   productData.clear();
//   notifyListeners();
// // }
// import 'package:flutter_riverpod/flutter_riverpod.dart';

//import 'package:multi_vendor_app/models/product_model.dart';

// final cartProvider =
//     StateNotifierProvider<CartNotifier, Map<String, CartModel>>(
//         (ref) => CartNotifier());

// class CartNotifier extends StateNotifier<Map<String, CartModel>> {
//   CartNotifier() : super({});

//   void addProductToCart({
//     required String productName,
//     required num productPrice,
//     required String catgoryName,
//     required List imageUrl,
//     required int quantity,
//     required String productId,
//     required String productSize,
//     required num discount,
//     required String description,
//     required String storeId,
//   }) {
//     if (state.containsKey(productId)) {
//       state = {
//         ...state,
//         productId: CartModel(
//           productId: state[productId]!.productId,
//           productName: state[productId]!.productName,
//           productPrice: state[productId]!.productPrice,
//           catgoryName: state[productId]!.catgoryName,
//           quantity: state[productId]!.quantity + 1,
//           imageUrl: state[productId]!.imageUrl,
//           productSize: state[productId]!.productSize,
//           discount: state[productId]!.discount,
//           description: state[productId]!.description,
//           storeId:  state[storeId]!.storeId, categoryName: null,
//         )
//       };
//     } else {
//       state = {
//         ...state,
//         productId: CartModel(
//           productName: productName,
//           productPrice: productPrice,
//           catgoryName: catgoryName,
//           imageUrl: imageUrl,
//           quantity: quantity,
//           productId: productId,
//           productSize: productSize,
//           discount: discount,
//           description: description,
//           storeId: storeId, categoryName: null,
//         )
//       };
//     }
//   }

//   void decrementItem(String productId) {
//     if (state.containsKey(productId)) {
//       state[productId]!.quantity--;

//       ///notify listeners that the state has changed
//       ///
//       state = {...state};
//     }
//   }

//   void removeItem(String productId) {
//     state.remove(productId);

//     state = {...state};
//   }

//   void incrementItem(String productId) {
//     if (state.containsKey(productId)) {
//       state[productId]!.quantity++;

//       ///notify listeners that the state has changed
//       ///
//       state = {...state};
//     }
//   }

//   double calculateTotalAmount() {
//     double totalAmount = 0.0;
//     state.forEach((productId, cartItem) {
//       totalAmount += cartItem.quantity * cartItem.discount;
//     });

//     return totalAmount;
//   }

//   Map<String, CartModel> get getCartItems => state;
// }
// Import required packages
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

// ProductProvider to manage product-related fields
class ProductProvider extends ChangeNotifier {
  Map<String, dynamic> productData = {};

  void getFormData({
    String? productName,
    double? productPrice,
    int? quantity,
    String? category,
    String? description,
    DateTime? scheduleDate,
    List<String>? imageUrlList,
    bool? chargeShipping,
    int? shippingCharge,
    String? brandName,
    List<String>? sizeList,
  }) {
    if (productName != null) productData['productName'] = productName;
    if (productPrice != null) productData['productPrice'] = productPrice;
    if (quantity != null) productData['quantity'] = quantity;
    if (category != null) productData['category'] = category;
    if (description != null) productData['description'] = description;
    if (scheduleDate != null) productData['scheduleDate'] = scheduleDate;
    if (imageUrlList != null) productData['imageUrlList'] = imageUrlList;
    if (chargeShipping != null) productData['chargeShipping'] = chargeShipping;
    if (shippingCharge != null) productData['shippingCharge'] = shippingCharge;
    if (brandName != null) productData['brandName'] = brandName;
    if (sizeList != null) productData['sizeList'] = sizeList;

    notifyListeners();
  }

  void clearData() {
    productData.clear();
    notifyListeners();
  }
}

// CartNotifier to manage cart-related fields
final cartProvider =
    StateNotifierProvider<CartNotifier, Map<String, CartModel>>(
  (ref) => CartNotifier(),
);

class CartNotifier extends StateNotifier<Map<String, CartModel>> {
  CartNotifier() : super({});

  void addProductToCart({
    required String productName,
    required num productPrice,
    required String catgoryName,
    required List imageUrl,
    required int quantity,
    required String productId,
    required String productSize,
    required num discount,
    required String description,
    required String storeId,
  }) {
    if (state.containsKey(productId)) {
      state = {
        ...state,
        productId: CartModel(
          productId: state[productId]!.productId,
          productName: state[productId]!.productName,
          productPrice: state[productId]!.productPrice,
          catgoryName: state[productId]!.catgoryName,
          quantity: state[productId]!.quantity + 1,
          imageUrl: state[productId]!.imageUrl,
          productSize: state[productId]!.productSize,
          discount: state[productId]!.discount,
          description: state[productId]!.description,
          storeId: state[productId]!.storeId,
        ),
      };
    } else {
      state = {
        ...state,
        productId: CartModel(
          productName: productName,
          productPrice: productPrice,
          catgoryName: catgoryName,
          imageUrl: imageUrl,
          quantity: quantity,
          productId: productId,
          productSize: productSize,
          discount: discount,
          description: description,
          storeId: storeId,
        ),
      };
    }
  }

  void decrementItem(String productId) {
    if (state.containsKey(productId)) {
      state[productId]!.quantity--;
      state = {...state}; // Notify listeners
    }
  }

  void removeItem(String productId) {
    state.remove(productId);
    state = {...state}; // Notify listeners
  }

  void incrementItem(String productId) {
    if (state.containsKey(productId)) {
      state[productId]!.quantity++;
      state = {...state}; // Notify listeners
    }
  }

  double calculateTotalAmount() {
    double totalAmount = 0.0;
    state.forEach((productId, cartItem) {
      totalAmount += cartItem.quantity * cartItem.productPrice;
    });
    return totalAmount;
  }

  Map<String, CartModel> get getCartItems => state;

  void removeAllItem() {}
}

// CartModel class for representing cart items
class CartModel {
  final String productId;
  final String productName;
  final num productPrice;
  final String catgoryName;
  int quantity;
  final List imageUrl;
  final String productSize;
  final num discount;
  final String description;
  final String storeId;

  CartModel({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.catgoryName,
    required this.quantity,
    required this.imageUrl,
    required this.productSize,
    required this.discount,
    required this.description,
    required this.storeId,
  });

  get productQuantity => null;
}
