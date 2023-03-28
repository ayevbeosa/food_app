import 'package:food_app/db/addition_with_options.dart';
import 'package:food_app/db/app_database.dart';

class BasketWithAdditions {
  final Basket basket;
  final List<AdditionWithOptions> additionItems;

  BasketWithAdditions(this.basket, this.additionItems);
}
