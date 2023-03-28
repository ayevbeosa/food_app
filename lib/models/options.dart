class Options {
  late String name;
  late String price;
  late String quantity;

  Options({
    required this.name,
    required this.price,
    required this.quantity,
  });

  Options.fromJson(dynamic json) {
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
  }
}
