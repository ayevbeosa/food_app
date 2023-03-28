import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_app/db/app_database.dart';
import 'package:food_app/db/basket_with_additions.dart';
import 'package:food_app/pages/checkout_page.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/widgets/basket_item_container.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatefulWidget {
  final String restaurantName;
  final String deliveryTime;
  final double subTotal;

  BasketPage({
    required this.restaurantName,
    required this.subTotal,
    required this.deliveryTime,
  });

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  double _deliveryFee = 2.0;
  double _total = 0.0;

  @override
  void initState() {
    _total = widget.subTotal + _deliveryFee;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final basketsDao = Provider.of<AppDatabase>(context).basketsDao;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            AntDesign.arrowleft,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Basket',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              widget.restaurantName,
              textScaleFactor: 0.7,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(AntDesign.delete),
            onPressed: () {
              basketsDao
                  .clearTables()
                  .whenComplete(() => Navigator.of(context).pop());
            },
            color: kPrimaryColor,
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: kPaddingVertical16,
            child: Card(
              child: Padding(
                padding: kPadding16,
                child: Row(
                  children: [
                    Icon(
                      Entypo.shopping_cart,
                      color: kPrimaryColor,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      'Deliver from 15:30 - 15:45',
                      textScaleFactor: 1.1,
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     showBottomSheet(
                    //       context: context,
                    //       builder: (context) {},
                    //     );
                    //   },
                    //   child: Text(
                    //     'Change',
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(
              'Items',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18.0,
              ),
            ),
          ),
          StreamBuilder<List<BasketWithAdditions>>(
            stream: basketsDao.getItemsFromBasket(),
            builder: (context, snapshot) {
              Widget child;
              if (snapshot.hasError) {
                child = Container();
              } else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    child = Container();
                    break;
                  case ConnectionState.waiting:
                    child = SizedBox(
                      child: const CircularProgressIndicator(),
                      width: 60,
                      height: 60,
                    );
                    break;
                  case ConnectionState.active:
                    child = _buildBasketListWidget(snapshot.data!);
                    break;
                  case ConnectionState.done:
                    child = _buildBasketListWidget(snapshot.data!);
                    break;
                }
              }
              return child;
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: kPadding16To8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    '£${_total.toStringAsFixed(2)}',
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: kPadding16To8,
              child: ElevatedButton(
                child: Text(
                  'Go to checkout',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CheckoutPage(
                        restaurantName: widget.restaurantName,
                        deliveryTime: widget.deliveryTime,
                        total: _total,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasketListWidget(List<BasketWithAdditions> basketList) {
    return Card(
      child: Padding(
        padding: kPadding16,
        child: Column(
          children: [
            Column(
              children: List.generate(
                basketList.length,
                (index) {
                  final basketWithAdditions = basketList[index];
                  String items = basketWithAdditions.additionItems.fold<String>(
                    '',
                    (prev, element) =>
                        prev +
                        element.optionItems.fold<String>(
                          '',
                          (prev, element) => prev + '\n${element.name}',
                        ),
                  );

                  return BasketItemContainer(
                    title: basketWithAdditions.basket.order,
                    quantity: basketWithAdditions.basket.quantity,
                    price: basketWithAdditions.basket.price,
                    items: items,
                  );
                },
              ),
            ),
            Padding(
              padding: kPaddingHorizontal8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '£${widget.subTotal.toStringAsFixed(2)}',
                    textScaleFactor: 1.1,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 6.0)),
            Padding(
              padding: kPaddingHorizontal8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery fee',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '£$_deliveryFee',
                    textScaleFactor: 1.1,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
