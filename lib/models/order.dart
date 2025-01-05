import 'items.dart';

class Order {
  final String id;
  final List<Item> items;
  final double totalPrice;
  final DateTime date;

  Order({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.date,
  });
}
