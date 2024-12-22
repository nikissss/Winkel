
// import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider, PhoneAuthProvider, GoogleAuthProvider;
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:vendor_app_only/vendor/views/auth/vendor_registeration_screen.dart';
// import 'package:vendor_app_only/vendor/views/screens/landing_screen.dart';

// class VendorAuthScreen extends StatefulWidget {
//   const VendorAuthScreen({super.key});

//   @override
//   State<VendorAuthScreen> createState() => _VendorAuthScreenState();
// }

// class _VendorAuthScreenState extends State<VendorAuthScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       initialData: FirebaseAuth.instance.currentUser,
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return SignInScreen(
//             providers: [
//               EmailAuthProvider(),
//               // GoogleProviderConfiguration(
//               //   clientId: '1:6329481609:android:4d8e8a3e0cb52d4c99c958', 
//               // ),
//               // PhoneProviderConfiguration(),
//             ],
//           );
//         }
//         return const LandingScreen();
//       },
//     );
//   }
// }

// // class GoogleProviderConfiguration {
// // }

// // class PhoneProviderConfiguration {
// // }

// class EmailProviderConfiguration {
// }

// import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider, PhoneAuthProvider, GoogleAuthProvider;
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:vendor_app_only/vendor/views/screens/landing_screen.dart';

// class VendorAuthScreen extends StatefulWidget {
//   const VendorAuthScreen({super.key});


//   @override
//   State<VendorAuthScreen> createState() => _VendorAuthScreenState();
// }

// class _VendorAuthScreenState extends State<VendorAuthScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       initialData: FirebaseAuth.instance.currentUser,
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return SignInScreen(); // Exclude providerConfigs
//         }
//         return const LandingScreen();
//       },
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor_app/vendor/views/screens/landing_screen.dart';


class VendorAuthScreen extends StatelessWidget {
  const VendorAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      // If the user is already signed-in, use it as initial data
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          return SignInScreen(providers: [
            EmailAuthProvider(),
          ]);
        }

        // Render your application if authenticated
        return  LandingScreen();
        // return const Text('Authenticated');
      },
    );
  }
}