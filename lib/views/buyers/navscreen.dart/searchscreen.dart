import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_vendor_app/views/buyers/productDetail/product_detail_screen.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<QueryDocumentSnapshot> _searchResults = [];
  bool _isLoading = false;
  late stt.SpeechToText _speechToText;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speechToText = stt.SpeechToText();
    _performSearch(""); // Fetch all products initially
  }

  Future<void> _performSearch(String searchQuery) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final QuerySnapshot result =
          await _firestore.collection('products').get();

      List<QueryDocumentSnapshot> products = result.docs;

      if (searchQuery.isNotEmpty) {
        products = products.where((doc) {
          final productName = (doc['productName'] as String).toLowerCase();
          final query = searchQuery.toLowerCase();
          return productName.contains(query);
        }).toList();
      }

      setState(() {
        _searchResults = products;
      });
    } catch (error) {
      print('Error searching products: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _startListening() async {
    bool available = await _speechToText.initialize(
      onStatus: (status) => print('Speech status: $status'),
      onError: (error) => print('Speech error: $error'),
    );

    if (available) {
      setState(() {
        _isListening = true;
      });

      _speechToText.listen(
        onResult: (result) {
          setState(() {
            _searchController.text = result.recognizedWords;
            _performSearch(result.recognizedWords);
          });
        },
      );
    }
  }

  void _stopListening() {
    setState(() {
      _isListening = false;
    });
    _speechToText.stop();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _speechToText.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                autofocus: true,
                onChanged: (searchQuery) {
                  _performSearch(searchQuery.toLowerCase());
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Search for product",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child:
                        SvgPicture.asset('assets/icons/search.svg', width: 10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isListening ? Icons.mic : Icons.mic_none,
                      color: _isListening ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      if (_isListening) {
                        _stopListening();
                      } else {
                        _startListening();
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                _performSearch(_searchController.text.toLowerCase());
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Search'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          if (_isLoading) const Center(child: CircularProgressIndicator()),
          Expanded(
            child: _searchResults.isEmpty && !_isLoading
                ? const Center(child: Text('No products found'))
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final product =
                          _searchResults[index].data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text(
                            product['productName']?.toString() ?? 'No name'),
                        subtitle: Text(product['description']?.toString() ??
                            'No description'),
                        trailing: Text(
                            '\$${(product['productPrice']?.toString() ?? '0.00')}'),
                        onTap: () {
                          // Navigate to the ProductDetailsScreen when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(productData: product),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
