import 'package:food_app/dummy/additions.dart';

class Order {
  late String name;
  late String description;
  late String unitPrice;
  late List<Additions> additionsList;

  Order({
    required this.name,
    required this.description,
    required this.unitPrice,
    required this.additionsList,
  });

  static List<Order> orders = [
    Order(
      name: 'Name',
      description: 'Description',
      unitPrice: '1.00',
      additionsList: [
        Additions(
          optionName: 'Add a drink',
          selection: 'multiple',
          options: [
            Options(option: 'Coca-Cola', price: 2.60),
            Options(option: 'Sprite', price: 2.60),
            Options(option: 'Diet Coke', price: 2.60),
          ],
        ),
      ],
    ),
    Order(
      name: 'Name',
      description: 'Description',
      unitPrice: '1.00',
      additionsList: [
        Additions(
          optionName: 'Bread Options',
          selection: 'single',
          options: [
            Options(option: 'Sliced Bread'),
            Options(option: 'Unsliced Bread'),
            Options(option: 'Shortbread'),
          ],
        ),
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
    Order(
      name: 'Name',
      description: 'Description',
      unitPrice: '1.00',
      additionsList: [],
    ),
    Order(
      name: 'Name',
      description: 'Description',
      unitPrice: '1.00',
      additionsList: [
        Additions(
          optionName: 'Salad options',
          selection: 'dual',
          options: [
            Options(option: 'Tomatoes', price: 0.60),
            Options(option: 'Corn', price: 0.60),
            Options(option: 'Lettuce', price: 0.60),
            Options(option: 'Baked Beans', price: 0.60),
            Options(option: 'Cucumber', price: 0.60),
          ],
        ),
      ],
    ),
    Order(
      name: 'Name',
      description: '',
      unitPrice: '1.00',
      additionsList: [],
    ),
    Order(
      name: 'Name',
      description: 'Description',
      unitPrice: '1.00',
      additionsList: [],
    ),
    Order(
      name: 'Name',
      description: 'Description',
      unitPrice: '1.00',
      additionsList: [
        Additions(
          optionName: 'Milk',
          selection: 'single',
          options: [
            Options(option: 'Dairy', price: 0.60),
            Options(option: 'Almond', price: 0.60),
            Options(option: 'Soya', price: 0.60),
          ],
        ),
      ],
    ),
  ];
}
