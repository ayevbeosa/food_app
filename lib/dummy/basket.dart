import 'package:food_app/dummy/additions.dart';

class Basket {
  late String order;
  late int quantity;
  late double price;
  late List<Additions> additionsList;

  Basket({
    required this.order,
    required this.quantity,
    required this.price,
    required this.additionsList,
  });
}

List<Basket> basketList = [
  Basket(
    order: 'Sweet Chilli Chicken',
    quantity: 1,
    price: 12.80,
    additionsList: [
      Additions(
        optionName: 'Toasted',
        selection: 'single',
        options: [
          Options(option: 'Yes'),
          Options(option: 'No'),
        ],
      ),
    ],
  ),
  Basket(
    order: 'Sweet Chilli Chicken',
    quantity: 1,
    price: 12.80,
    additionsList: [],
  ),
];
