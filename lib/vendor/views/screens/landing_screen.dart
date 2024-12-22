// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:vendor_app_only/vendor/models/vendor_user_models.dart';

// class LandingScreen extends StatelessWidget {
//   const LandingScreen({super.key});

 
//   @override
//   Widget build(BuildContext context) {
// final FirebaseAuth _auth = FirebaseAuth.instance;
// final CollectionReference _vendorsStream = FirebaseFirestore.instance.collection('vendors');

//     return Scaffold(
//       body:StreamBuilder<QuerySnapshot>(
//       stream: _vendorsStream.doc(_auth.currentUser!.uid).snapshots(),
//       builder:
//        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return const Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Text("Loading");
//         }
// VendorUserModels vendorUserModel = VendorUserModels.fromJson(
//   snapshot.data!.data()! as Map<String, dynamic> );

//         return Center(child: 
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(vendorUserModel.businessName.toString()),
//           ],
//         ));
//       },
//     ),
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:vendor_app_only/vendor/models/vendor_user_models.dart';
// import 'package:vendor_app_only/vendor/views/auth/vendor_registeration_screen.dart';
// import 'package:vendor_app_only/vendor/views/screens/main_vendor_screen.dart';

// class LandingScreen extends StatelessWidget {
//   const LandingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     final DocumentReference _vendorDoc = FirebaseFirestore.instance
//         .collection('vendors')
//         .doc(_auth.currentUser!.uid);

//     return Scaffold(
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: _vendorDoc.snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return const Center(
//               child: Text('Something went wrong'));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: Text("Loading..."));
//           }

//           // if (!snapshot.hasData || !snapshot.data!.exists) {
//           //   return const Center(child: Text("No data found"));
//           // }
//             if ( !snapshot.data!.exists) {
//             return VendorRegisterationScreen();
//           }

//       VendorUserModel vendorUserModel = VendorUserModel.fromJson(
//             snapshot.data!.data() as Map<String, Object>,
//           );


// // if(vendorUserModel.approved== true){
// //   return MainVendorScreen();
// // }
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
// ClipRRect(
//   borderRadius: BorderRadius.circular(5),
//   child: Image.network(
//     vendorUserModel.storeImage.toString(),
//     width:90,
//     fit:BoxFit.cover,
//     ),
// ),


// const SizedBox(height: 15),

// Text(vendorUserModel.businessName.toString(),
// style: const TextStyle(
//   fontSize: 22,
//   fontWeight:FontWeight.w500,
// ),
// ),
// const SizedBox(height: 10,),

// const Text(
  
//   'Your application has been sent to shop admin\n Admin will get back to you soon',
// style: TextStyle(
//   fontSize: 22,
//   fontWeight: FontWeight.w400,
// ),
// textAlign: TextAlign.center,
// ),


// const SizedBox(height: 10,),

// TextButton(
//   onPressed: () async{
// await _auth.signOut();
//   }, 
//   child: Text('SignOut')
//   ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multi_vendor_app/vendor/models/vendor_user_models.dart';
import 'package:multi_vendor_app/vendor/views/auth/vendor_registeration_screen.dart';

// Adjust this import based on where you define VendorUserModel

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final DocumentReference _vendorDoc = FirebaseFirestore.instance
        .collection('vendors')
        .doc(_auth.currentUser?.uid);

    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: _vendorDoc.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading..."));
          }

          // Check if document exists and has data
          if (!snapshot.hasData || snapshot.data?.data() == null || !snapshot.data!.exists) {
            return  VendorRegistrationScreen();
          }


          // Safely cast data to Map<String, dynamic>
          final data = snapshot.data!.data() as Map<String, dynamic>?;

          if (data == null) {
            return const Center(child: Text("No data found"));
          }

          // VendorUserModel vendorUserModel = VendorUserModel.fromJson(data);
VendorUserModel vendorUserModel = VendorUserModel.fromJson(data);


          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    vendorUserModel.storeImage ?? '',
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  vendorUserModel.bussinessName ?? 'No business name',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Your application has been sent to shop admin\n Admin will get back to you soon',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  child: const Text('Sign Out'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:vendor_app_only/vendor/models/vendor_user_models.dart';
// import 'package:vendor_app_only/vendor/views/auth/vendor_registeration_screen.dart';


// import 'main_vendor_screen.dart';

// class LandingScreen extends StatelessWidget {
//   static const String routeName = '\landing-screen';

//   @override
//   Widget build(BuildContext context) {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     final CollectionReference _vendorsStream =
//         FirebaseFirestore.instance.collection('vendors');
//     return Scaffold(
//         body: StreamBuilder<DocumentSnapshot>(
//       stream: _vendorsStream.doc(_auth.currentUser!.uid).snapshots(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }

//         if (!snapshot.data!.exists) {
//           return VendorRegistrationScreen();
//         }

//         VendorUserModel vendorUserModel = VendorUserModel.fromJson(
//             snapshot.data!.data()! as Map<String, dynamic>);

//         if (vendorUserModel.approved == true) {
//           return MainVendorScreen();
//         }

//         return Center(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(5),
//               child: Image.network(
//                 vendorUserModel.storeImage.toString(),
//                 width: 90,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           const  SizedBox(
//               height: 15,
//             ),
//             Text(
//               vendorUserModel.bussinessName.toString(),
//               style: const TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//            const  SizedBox(
//               height: 10,
//             ),
//            const Text(
//               'Your application has been sent to shop admin\n Admin will get back to you soon',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w400,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           const  SizedBox(
//               height: 10,
//             ),
//             TextButton(
//               onPressed: () async {
//                 await _auth.signOut();
//               },
//               child: const Text('Signout'),
//             ),
//           ],
//         ));
//       },
//     ));
//   }
// }