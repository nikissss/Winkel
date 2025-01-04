// import 'package:flutter/material.dart';
// import 'package:khalti_checkout_flutter/khalti_checkout_flutter.dart';

// class KhaltiPaymentPage extends StatefulWidget {
//   final Map<dynamic, dynamic> response;
//   final Function onPaymentSuccessful;

//   const KhaltiPaymentPage(
//       {super.key, required this.response, required this.onPaymentSuccessful});

//   @override
//   State<KhaltiPaymentPage> createState() => _KhaltiPaymentPageState();
// }

// class _KhaltiPaymentPageState extends State<KhaltiPaymentPage> {
//   late final Future<Khalti?> khalti;
//   @override
//   void initState() {
//     super.initState();

//     final payConfig = KhaltiPayConfig(
//       publicKey: "fbe971d7c7f246dbaa614e662c62beb5",
//       pidx: widget.response["pidx"] ?? "",
//       environment: Environment.test,
//     );

//     khalti = Khalti.init(
//       enableDebugging: true,
//       payConfig: payConfig,
//       onPaymentResult: (paymentResult, khalti) {
//         if (paymentResult.payload!.status == "Completed") {
//           widget.onPaymentSuccessful(true);
//           khalti.close(context);
//           // Navigator.of(context).pushAndRemoveUntil(
//           //     MaterialPageRoute(builder: (context) => const Dashboard()),
//           //     (Route<dynamic> route) => false);
//         } else {
//           khalti.close(context);
//           Navigator.pop(context);
//         }
//       },
//       onMessage: (
//         khalti, {
//         description,
//         statusCode,
//         event,
//         needsPaymentConfirmation,
//       }) async {
//         print(
//           'Description: $description, Status Code: $statusCode, Event: $event, NeedsPaymentConfirmation: $needsPaymentConfirmation',
//         );
//         print("message here");

//         if (event == KhaltiEvent.kpgDisposed) {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             Navigator.pop(context);
//           });
//         }
//         khalti.close(context);
//         // Navigator.pop(context);
//       },
//       // onReturn: () => Navigator.pop(context),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder(
//           future: khalti,
//           initialData: null,
//           builder: (context, snapshot) {
//             final khaltiSnapshot = snapshot.data;
//             if (khaltiSnapshot == null) {
//               return const CircularProgressIndicator.adaptive();
//             } else {
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 khaltiSnapshot.open(context);
//               });
//               // Navigator.pop(context);
//               return const Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:khalti_checkout_flutter/khalti_checkout_flutter.dart';

class KhaltiPaymentPage extends StatefulWidget {
  final Map<dynamic, dynamic> response;
  final Function onPaymentSuccessful;

  const KhaltiPaymentPage(
      {super.key, required this.response, required this.onPaymentSuccessful});

  @override
  State<KhaltiPaymentPage> createState() => _KhaltiPaymentPageState();
}

class _KhaltiPaymentPageState extends State<KhaltiPaymentPage> {
  late final Future<Khalti?> khalti;

  @override
  void initState() {
    super.initState();

    print("Initializing Khalti with response: ${widget.response}");

    final payConfig = KhaltiPayConfig(
      publicKey: "3995b70bfaca41ce8e0b0e1f88d9a133",
      pidx: widget.response["pidx"] ?? "",
      environment: Environment.test,
    );

    print("PayConfig created: $payConfig");

    khalti = Khalti.init(
      enableDebugging: true,
      payConfig: payConfig,
      onPaymentResult: (paymentResult, khalti) {
        print("Payment result received: ${paymentResult.payload}");
        if (paymentResult.payload?.status == "Completed") {
          widget.onPaymentSuccessful(true);
          khalti.close(context);
        } else {
          print("Payment failed or canceled.");
          khalti.close(context);
          Navigator.pop(context);
        }
      },
      onMessage: (
        khalti, {
        description,
        statusCode,
        event,
        needsPaymentConfirmation,
      }) async {
        print(
          'Khalti Message - Description: $description, Status Code: $statusCode, Event: $event, NeedsPaymentConfirmation: $needsPaymentConfirmation',
        );
        if (event == KhaltiEvent.kpgDisposed) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pop(context);
          });
        }
        khalti.close(context);
      },
    );

    print("Khalti initialization started.");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: khalti,
          initialData: null,
          builder: (context, snapshot) {
            print("FutureBuilder state: ${snapshot.connectionState}");

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            } else if (snapshot.hasError) {
              print("Error in FutureBuilder: ${snapshot.error}");
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final khaltiSnapshot = snapshot.data;
              if (khaltiSnapshot != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  print("Opening Khalti UI...");
                  khaltiSnapshot.open(context);
                });
              }
              return const CircularProgressIndicator();
            } else {
              return const Text("Payment process completed or canceled.");
            }
          },
        ),
      ),
    );
  }
}
