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
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        title: const Text(
          'Cart Screen',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _cartProvider.removeallItems();
            },
            icon: Icon(
              CupertinoIcons.delete,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _cartProvider.getCartItem.isNotEmpty
                ? ListView.builder(
                    itemCount: _cartProvider.getCartItem.length,
                    itemBuilder: (context, index) {
                      final cartData =
                          _cartProvider.getCartItem.values.toList()[index];
                      return Card(
                        child: SizedBox(
                          height: 170,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.network(cartData.imageUrl[0]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartData.productName,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 5,
                                      ),
                                    ),
                                    Text(
                                      '\S ${cartData.price.toStringAsFixed(2)}',
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
                                          height: 30,
                                          width: 170,
                                          decoration: BoxDecoration(
                                            color: Colors.red.shade400,
                                          ),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed:
                                                    cartData.quantity == 1
                                                        ? null
                                                        : () {
                                                            _cartProvider
                                                                .decreement(
                                                                    cartData);
                                                          },
                                                icon: const Icon(
                                                  CupertinoIcons.minus,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                              ),
                                              Text(
                                                cartData.quantity.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  _cartProvider
                                                      .increement(cartData);
                                                },
                                                icon: const Icon(
                                                  CupertinoIcons.plus,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            _cartProvider.removeItem(
                                              cartData.productId,
                                            );
                                          },
                                          icon: const Icon(
                                            CupertinoIcons.cart_badge_minus,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Your shopping cart is empty',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 13, 62, 86),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Continue Shopping",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '\$${_cartProvider.totalPrice.toStringAsFixed(2)}\nCHECKOUT',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    letterSpacing: 8,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
