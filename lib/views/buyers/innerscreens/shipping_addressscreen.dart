import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_vendor_app/views/buyers/navscreen.dart/widgets/button_widget.dart';
//import 'package:multi_vendor_app/views/buyers/navscreen.dart/widgets/custom_textfield.dart';
import 'package:multi_vendor_app/views/buyers/navscreen.dart/widgets/custontextfield.dart';

class ShippingAddressScreen extends StatefulWidget {
  ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String pinCode = '';
  String locality = '';
  String city = '';
  String state = '';
  bool isLoading = false;

  Future<void> saveShippingAddress() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    try {
      final user = _auth.currentUser;
      if (user == null) throw Exception('User not authenticated');

      // Create shipping address data
      final addressData = {
        'userId': user.uid,
        'pinCode': pinCode,
        'locality': locality,
        'city': city,
        'state': state,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };

      // Save to shippingAddresses collection
      await _firestore
          .collection('shippingAddresses')
          .doc(user.uid)
          .set(addressData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Address saved successfully')),
      );

      // Navigate back or to payment
      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${error.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
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
          style: GoogleFonts.getFont(
            'Lato',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Color(0xFF102DE1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Where will your ordered\nitems be shipped?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    label: 'Pin Code',
                    prefixIcon: Icon(null),
                    text: 'Enter pin code',
                    validator: (value) {
                      if (value?.isEmpty ?? true) return "Enter Pin Code";
                      return null;
                    },
                    onChanged: (value) {
                      pinCode = value.trim();
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    label: 'Locality',
                    prefixIcon: Icon(null),
                    text: 'Enter locality',
                    validator: (value) {
                      if (value?.isEmpty ?? true) return "Enter Locality";
                      return null;
                    },
                    onChanged: (value) {
                      locality = value.trim();
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    label: 'City',
                    prefixIcon: Icon(null),
                    text: 'Enter city',
                    validator: (value) {
                      if (value?.isEmpty ?? true) return "Enter City";
                      return null;
                    },
                    onChanged: (value) {
                      city = value.trim();
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    label: 'State',
                    prefixIcon: Icon(null),
                    text: 'Enter state',
                    validator: (value) {
                      if (value?.isEmpty ?? true) return "Enter State";
                      return null;
                    },
                    onChanged: (value) {
                      state = value.trim();
                    },
                  ),
                  SizedBox(height: 20),
                  ButtonWidgets(
                    isLoading: isLoading,
                    buttonChange: saveShippingAddress,
                    buttonTitle: 'Save & Continue to Payment',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
