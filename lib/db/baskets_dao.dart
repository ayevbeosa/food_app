import 'package:food_app/db/addition_with_options.dart';
import 'package:food_app/db/additions.dart';
import 'package:food_app/db/app_database.dart';
import 'package:food_app/db/basket_with_additions.dart';
import 'package:food_app/db/baskets.dart';
import 'package:food_app/db/options.dart';
import 'package:food_app/dummy/order.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

part 'baskets_dao.g.dart';

@UseDao(tables: [Options, Additions, Baskets])
class BasketsDao extends DatabaseAccessor<AppDatabase> with _$BasketsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  BasketsDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<void> addOrderToBasket(Order order, int quantity, double price) async {
    return transaction(() async {
      // first, we write the shopping cart
      final basketId = await into(baskets).insert(
        BasketsCompanion.insert(
          order: order.name,
          quantity: quantity,
          price: price,
        ),
        onConflict: DoUpdate(
          (old) => BasketsCompanion.custom(
            quantity: Constant(quantity),
          ),
        ),
      );

      print('Writing basket with id: $basketId...');

      // And write the new ones
      for (final item in order.additionsList) {
        final additionsId = await into(additions).insert(
          AdditionsCompanion.insert(
            basketId: basketId,
            name: item.optionName,
            selectionType: item.selection,
          ),
        );

        print('Writing additions with id: $additionsId...');

        for (final option in item.options) {
          final optionsId = await into(options).insert(
            OptionsCompanion.insert(
              additionsId: additionsId,
              name: option.option,
              price: option.price * option.quantity,
              quantity: Value(option.quantity),
            ),
            onConflict: DoUpdate(
              (old) => OptionsCompanion.custom(
                quantity: Constant(quantity),
                price: Constant(option.price * option.quantity),
              ),
            ),
          );

          print('Writing options with id: $optionsId...');
        }
      }
    });
  }

  Future<void> clearTables() async {
    return transaction(() async {
      await delete(options)
          .go()
          .then((value) => print('Deleted $value rows in `options` table'));
      await delete(additions)
          .go()
          .then((value) => print('Deleted $value rows in `additions` table'));
      await delete(baskets)
          .go()
          .then((value) => print('Deleted $value rows in `baskets` table'));
    });
  }

  Stream<List<BasketWithAdditions>> getItemsFromBasket() {
    final basketsStream = select(baskets).watch();
    final additionsStream = select(additions).watch();
    final optionsStream = select(options).watch();

    return Rx.combineLatest3(
      basketsStream,
      additionsStream,
      optionsStream,
      (List<Basket> a, List<Addition> b, List<Option> c) {
        return a.map((basket) {
          print('Reading basket ${basket.order} with id: ${basket.id}');
          final additions =
              b.where((addition) => addition.basketId == basket.id).toList();

          final additionItems = additions.map((addition) {
            final options =
                c.where((option) => option.additionsId == addition.id).toList();

            return AdditionWithOptions(addition, options);
          }).toList();

          return BasketWithAdditions(basket, additionItems);
        }).toList();
      },
    );
  }
}
