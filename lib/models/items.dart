class Item {
  final String id;
  final String name;
  final double price;
  final int quantity; // Add quantity if needed

  Item({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}
