import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor_app/views/buyers/productDetail/product_detail_screen.dart';

class MainProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
        .collection('products')
        // .where('category', isEqualTo: categoryName)
        // .where('approved', isEqualTo: true)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _productsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LinearProgressIndicator(
              color: Colors.amber,
            ),
          );
        }

        return Container(
          height: 270,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final productData = snapshot.data!.docs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductDetailScreen(productData: productData);
                  }));
                },
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        height: 170,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(productData['imageUrl'][0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productData['productName'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '\$${productData['productPrice'].toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, _) => SizedBox(width: 15),
          ),
        );
      },
    );
  }
}
