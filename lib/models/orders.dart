import 'additions.dart';

class Orders {
  late String category;
  late String name;
  late String description;
  late String unitPrice;
  List<Additions> additions = [];

  Orders({
    required this.category,
    required this.name,
    required this.description,
    required this.unitPrice,
    required this.additions,
  });

  Orders.fromJson(dynamic json) {
    category = json['category'];
    name = json['name'];
    description = json['description'];
    unitPrice = json['unit_price'];
    if (json['additions'] != null) {
      json['additions'].forEach((v) {
        additions.add(Additions.fromJson(v));
      });
    }
  }
}
