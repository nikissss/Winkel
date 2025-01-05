import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_vendor_app/views/buyers/navscreen.dart/widgets/button_widget.dart';
// import 'package:multi_vendor_app/views/buyers/navscreen.dart/widgets/custom_textfield.dart';

// class ShippingAddressScreen extends StatefulWidget {
//   ShippingAddressScreen({super.key});

//   @override
//   State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
// }

// class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   late String pinCode;

//   late String locality;

//   late String city;

//   late String state;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white.withOpacity(0.96),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white.withOpacity(0.96),
//         title: Text(
//           'Delivery',
//           style: GoogleFonts.getFont(
//             'Lato',
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         centerTitle: true,
//         iconTheme: IconThemeData(
//           color: Color(
//             0xFF102DE1,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Where will your ordered\nitems be shipped?',
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.getFont(
//                       'Lato',
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 2,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   CustomTextField(
//                     label: 'Pin Code',
//                     prefixIcon: Icon(null),
//                     text: 'Enter pin code',
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return "Enter Pin Code";
//                       } else {
//                         return null;
//                       }
//                     },
//                     onChanged: (value) {
//                       pinCode = value;
//                     },
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   CustomTextField(
//                     label: 'Locality',
//                     prefixIcon: Icon(null),
//                     text: 'Enter locality',
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return "Enter  Locality";
//                       } else {
//                         return null;
//                       }
//                     },
//                     onChanged: (value) {
//                       locality = value;
//                     },
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   CustomTextField(
//                     label: 'City',
//                     prefixIcon: Icon(null),
//                     text: 'Enter city',
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return "Enter City";
//                       } else {
//                         return null;
//                       }
//                     },
//                     onChanged: (value) {
//                       city = value;
//                     },
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   CustomTextField(
//                     label: 'State',
//                     prefixIcon: Icon(null),
//                     text: 'Enter state',
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return "Enter state";
//                       } else {
//                         return null;
//                       }
//                     },
//                     onChanged: (value) {
//                       state = value;
//                     },
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   ButtonWidgets(
//                     isLoading: false,

//                     buttonChange: () async {
//                       if (_formKey.currentState!.validate()) {
//                         _showLoginDialog(context);
//                         await _firestore
//                             .collection('users')
//                             .doc(_auth.currentUser!.uid)
//                             .update({
//                           "pinCode": pinCode,
//                           'locality': locality,
//                           'city': city,
//                           'state': state,
//                         }).whenComplete(() {
//                           Navigator.pop(context);
//                         });
//                       }
//                     },
//                     buttonTitle: 'Go to Payment',
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void _showLoginDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Updating Address'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CircularProgressIndicator(),
//             SizedBox(height: 10),
//             Text('Please wait...'),
//           ],
//         ),
//       );
//     },
//   );

//   // Simulate a network call or some asynchronous task
//   Future.delayed(Duration(seconds: 3), () {
//     // Close the dialog when the task is complete
//     Navigator.of(context).pop();
//   });
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController localityController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  Map<String, dynamic>? userAddress;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchAddress();
  }

  Future<void> _fetchAddress() async {
    setState(() {
      _isLoading = true;
    });

    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        setState(() {
          userAddress = snapshot.data() as Map<String, dynamic>;
          pinCodeController.text = userAddress?["pinCode"] ?? "";
          localityController.text = userAddress?["locality"] ?? "";
          cityController.text = userAddress?["city"] ?? "";
          stateController.text = userAddress?["state"] ?? "";
        });
      }
    } catch (e) {
      print("Error fetching address: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _saveAddress() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await _firestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .update({
          "pinCode": pinCodeController.text,
          "locality": localityController.text,
          "city": cityController.text,
          "state": stateController.text,
        });

        // Fetch the updated address
        await _fetchAddress();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Address updated successfully!")),
        );
      } catch (e) {
        print("Error saving address: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to update address.")),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    pinCodeController.dispose();
    localityController.dispose();
    cityController.dispose();
    stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.96),
        title: Text(
          'Delivery Address',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (userAddress != null) ...[
                      Text(
                        'Saved Address:',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          "Pin Code: ${userAddress?["pinCode"] ?? "Not Available"}"),
                      Text(
                          "Locality: ${userAddress?["locality"] ?? "Not Available"}"),
                      Text("City: ${userAddress?["city"] ?? "Not Available"}"),
                      Text(
                          "State: ${userAddress?["state"] ?? "Not Available"}"),
                      const SizedBox(height: 20),
                    ],
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildTextField(
                            controller: pinCodeController,
                            label: "Pin Code",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your pin code.";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          _buildTextField(
                            controller: localityController,
                            label: "Locality",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your locality.";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          _buildTextField(
                            controller: cityController,
                            label: "City",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your city.";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          _buildTextField(
                            controller: stateController,
                            label: "State",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your state.";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _saveAddress,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text("Save Address"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
    );
  }
}
