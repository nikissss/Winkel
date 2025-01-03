import 'package:flutter/material.dart';
import 'package:multi_vendor_app/vendor/controllers/vendor_login_screen.dart';
import 'package:multi_vendor_app/vendor/views/screens/landing_screen.dart';
import 'package:multi_vendor_app/views/buyers/auth/login_screen.dart';

class MainloginScreen extends StatelessWidget {
  const MainloginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 300),
          child: Column(
            children: [
              TextButton(
                child: Text("Login As Customer"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              TextButton(
                child: Text("Login As Vendor"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VendorLoginScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
