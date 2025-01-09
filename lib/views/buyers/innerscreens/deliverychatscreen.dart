import 'package:flutter/material.dart';
import 'package:multi_vendor_app/views/buyers/innerscreens/delivery_chatapp.dart';

import 'package:multi_vendor_app/views/buyers/innerscreens/ordertracking.dart';
// Import the existing OrderTrackingMap

class DeliveryChatPage extends StatefulWidget {
  final String deliveryBoyName;

  const DeliveryChatPage({Key? key, required this.deliveryBoyName})
      : super(key: key);

  @override
  State<DeliveryChatPage> createState() => _DeliveryChatPageState();
}

class _DeliveryChatPageState extends State<DeliveryChatPage> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.deliveryBoyName}'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/deliveryboy.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                print("Error loading image: $error");
                return Center(
                  child: Text(
                    'Image not available',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
          // Content over the image
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Chat box
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Container(
              //     color: Colors.black.withOpacity(0.5),
              //     child: ListTile(
              //       leading: Icon(Icons.chat, color: Colors.white),
              //       title: Text(
              //         'Chat with ${widget.deliveryBoyName}',
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                          deliveryPersonName: widget.deliveryBoyName),
                    ),
                  );
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: ListTile(
                    leading: Icon(Icons.chat, color: Colors.white),
                    title: Text(
                      'Chat with ${widget.deliveryBoyName}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              // Track Order Button with hover effect
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MouseRegion(
                  onEnter: (_) => setState(() {
                    isHovering = true;
                  }),
                  onExit: (_) => setState(() {
                    isHovering = false;
                  }),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: isHovering ? Colors.blue[700] : Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the Order Tracking Map Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OrderTrackingMap(), // Use existing OrderTrackingMap
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          'Track Your Order',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
