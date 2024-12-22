import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class VendorLogoutscreen extends StatelessWidget {

final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(onPressed: ()async{
_auth.signOut();
      },
      child: Text('Logout Screen'),),
    );
  }
}