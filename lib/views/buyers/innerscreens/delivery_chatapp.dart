// import 'package:flutter/material.dart';

// class ChatScreen extends StatelessWidget {
//   final String deliveryPersonName;

//   ChatScreen({required this.deliveryPersonName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with $deliveryPersonName'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: EdgeInsets.all(10.0),
//               itemCount: 10, // Example message count
//               itemBuilder: (context, index) {
//                 bool isCustomer = index % 2 == 0;
//                 return Align(
//                   alignment:
//                       isCustomer ? Alignment.centerRight : Alignment.centerLeft,
//                   child: Container(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//                     margin: EdgeInsets.symmetric(vertical: 5.0),
//                     decoration: BoxDecoration(
//                       color: isCustomer ? Colors.blue : Colors.grey[300],
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Text(
//                       isCustomer
//                           ? 'Customer message $index'
//                           : '$deliveryPersonName message $index',
//                       style: TextStyle(
//                         color: isCustomer ? Colors.white : Colors.black,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//             color: Colors.white,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Type your message...',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Add send functionality here
//                   },
//                   child: Icon(Icons.send),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: ChatScreen(deliveryPersonName: 'Wes Ton'),
//   ));
// }
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String deliveryPersonName;

  ChatScreen({required this.deliveryPersonName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'sender': 'customer',
          'message': _messageController.text.trim(),
        });
      });
      _messageController.clear();

      // Simulate a response from the delivery person
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _messages.add({
            'sender': 'delivery',
            'message': 'Got it! I will update you soon.',
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.deliveryPersonName}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                bool isCustomer = _messages[index]['sender'] == 'customer';
                return Align(
                  alignment:
                      isCustomer ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      color: isCustomer ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      _messages[index]['message']!,
                      style: TextStyle(
                        color: isCustomer ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String deliveryBoyName = 'Wes Ton';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ChatScreen(deliveryPersonName: deliveryBoyName),
              ),
            );
          },
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: ListTile(
              leading: Icon(Icons.chat, color: Colors.white),
              title: Text(
                'Chat with $deliveryBoyName',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
