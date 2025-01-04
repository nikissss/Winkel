import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  await initiatePayment();
}

Future<void> initiatePayment() async {
  const String url = "https://dev.khalti.com/api/v2/epayment/initiate/";

  final Map<String, dynamic> payload = {
    "return_url": "http://example.com/",
    "website_url": "https://example.com/",
    "amount": "1000",
    "purchase_order_id": "Order01",
    "purchase_order_name": "test",
    "customer_info": {
      "name": "Ram Bahadur",
      "email": "test@khalti.com",
      "phone": "9800000001"
    }
  };

  final headers = {
    'Authorization': 'key live_secret_key_68791341fdd94846a146f0457ff7b455',
    'Content-Type': 'application/json',
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      print("Payment initiation successful: ${response.body}");
      final pidx = jsonDecode(response.body)['pidx'];
      if (pidx != null) {
        await verifyPayment(pidx);
      }
    } else {
      print(
          "Failed to initiate payment: ${response.statusCode}, ${response.body}");
    }
  } catch (e) {
    print("Error: $e");
  }
}

Future<void> verifyPayment(String pidx) async {
  const String url = "https://dev.khalti.com/api/v2/epayment/lookup/";

  final Map<String, dynamic> payload = {
    "pidx": pidx,
  };

  final headers = {
    'Authorization': 'key live_secret_key_68791341fdd94846a146f0457ff7b455',
    'Content-Type': 'application/json',
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      print("Payment verification successful: ${response.body}");
    } else {
      print(
          "Failed to verify payment: ${response.statusCode}, ${response.body}");
    }
  } catch (e) {
    print("Error: $e");
  }
}
