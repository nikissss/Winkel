// // import 'dart:developer';
// // import 'package:flutter/material.dart';
// // import 'package:khalti/khalti.dart';

// // class KhaltiSDKDemo extends StatefulWidget {
// //   const KhaltiSDKDemo({Key? key}) : super(key: key);

// //   @override
// //   State<KhaltiSDKDemo> createState() => _KhaltiSDKDemoState();
// // }

// // class _KhaltiSDKDemoState extends State<KhaltiSDKDemo> {
// //   @override
// //   void initState() {
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return KhaltiScope(
// //       publicKey:
// //           'fbe971d7c7f246dbaa614e662c62beb5', // Replace with your Khalti public key
// //       enabledDebugging: true,
// //       builder: (context, navigatorKey) {
// //         return MaterialApp(
// //           navigatorKey: navigatorKey,
// //           home: Scaffold(
// //             appBar: AppBar(
// //               title: const Text('Khalti SDK Demo'),
// //             ),
// //             body: Center(
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   _startPayment(context);
// //                 },
// //                 child: const Text('Pay with Khalti'),
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   void _startPayment(BuildContext context) {
// //     KhaltiScope.of(context).pay(
// //       config: PaymentConfig(
// //         amount: 1000, // Amount in paisa (10 NPR)
// //         productIdentity: '12345',
// //         productName: 'Test Product',
// //         productUrl: 'https://example.com/product',
// //         additionalData: {
// //           'vendor': 'Khalti',
// //         },
// //       ),
// //       preferences: [
// //         PaymentPreference.khalti, // Other preferences can be added
// //       ],
// //       onSuccess: (success) {
// //         log('Payment successful: ${success.token}');
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text('Payment Successful: ${success.token}')),
// //         );
// //       },
// //       onFailure: (failure) {
// //         log('Payment failed: ${failure.message}');
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text('Payment Failed: ${failure.message}')),
// //         );
// //       },
// //       onCancel: () {
// //         log('Payment canceled');
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text('Payment Cancelled')),
// //         );
// //       },
// //     );
// //   }
// // }

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:khalti/khalti.dart';
// import 'package:khalti_checkout_flutter/khalti_checkout_flutter.dart';

// class KhaltiSDKDemo extends StatefulWidget {
//   const KhaltiSDKDemo({super.key});

//   @override
//   State<KhaltiSDKDemo> createState() => _KhaltiSDKDemoState();
// }

// class _KhaltiSDKDemoState extends State<KhaltiSDKDemo> {
//   late final Future<Khalti> khalti;

//   @override
//   void initState() {
//     super.initState();
//     final payConfig = KhaltiPayConfig(
//       publicKey: 'fbe971d7c7f246dbaa614e662c62beb5', // Merchant's public key
//       pidx: pidx, // This should be generated via a server side POST request.
//       environment: Environment.prod,
//     );

//     khalti = Khalti.init(
//       enableDebugging: true,
//       payConfig: payConfig,
//       onPaymentResult: (paymentResult, khalti) {
//         log(paymentResult.toString());
//       },
//       onMessage: (
//         khalti, {
//         description,
//         statusCode,
//         event,
//         needsPaymentConfirmation,
//       }) async {
//         log(
//           'Description: $description, Status Code: $statusCode, Event: $event, NeedsPaymentConfirmation: $needsPaymentConfirmation',
//         );
//       },
//       onReturn: () => log('Successfully redirected to return_url.'),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Placeholder(); // Rest of the code
//   }
// }
