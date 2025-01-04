import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map> fetchPID(double amount) async {
  try {
    // Apply condition: If amount > 1000, set amount to 100

    var url = Uri.https("a.khalti.com", "/api/v2/epayment/initiate/");
    var response = await http.post(url, headers: {
      "Authorization": "Key c221fd37ab59411caf882c57e651f995"
    }, body: {
      "return_url": "https://example.com/",
      "website_url": "https://example.com/",
      "amount": (10 * 100).toString(),
      "purchase_order_id": "test1211",
      "purchase_order_name": "test",
    });
    // if (amount > 1000) {
    //   amount = 100;
    // }
    print(response.body);
    return json.decode(response.body);
  } catch (e) {
    return {"error": e.toString()};
  }
}
