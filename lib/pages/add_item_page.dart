import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_app/db/app_database.dart';
import 'package:food_app/dummy/additions.dart';
import 'package:food_app/dummy/order.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/widgets/additions_card.dart';
import 'package:provider/provider.dart';

class AddItemPage extends StatefulWidget {
  final Order order;

  AddItemPage({required this.order});

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  int _quantity = 1;
  List<Options> _selectedOptionsList = [];

  late Order selectedOrder;

  @override
  void initState() {
    selectedOrder = Order(
      name: widget.order.name,
      description: widget.order.description,
      unitPrice: widget.order.unitPrice,
      additionsList: widget.order.additionsList,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final basketsDao = Provider.of<AppDatabase>(context).basketsDao;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            AntDesign.close,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Customise item',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: kPaddingVertical16,
              child: Padding(
                padding: kPadding16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedOrder.name,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          '£${selectedOrder.unitPrice}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      selectedOrder.description,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildAdditions(),
            Card(
              margin: kPaddingVertical16,
              child: Padding(
                padding: kPaddingVertical16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        AntDesign.minuscircleo,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_quantity > 1) _quantity--;
                        });
                      },
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      '$_quantity',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    IconButton(
                      icon: Icon(
                        AntDesign.pluscircleo,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: kPadding16To8,
        child: ElevatedButton(
          child: Text(
            'Add Item',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          onPressed: () {
            double totalOrderPrice =
                (double.parse(selectedOrder.unitPrice) * _quantity) +
                    _selectedOptionsList.fold(
                      0.0,
                      (prev, curr) => prev + (curr.price * _quantity),
                    );
            basketsDao.addOrderToBasket(
              selectedOrder,
              _quantity,
              totalOrderPrice,
            );
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(50.0),
          ),
        ),
      ),
    );
  }

  Widget _buildAdditions() {
    if (selectedOrder.additionsList.isNotEmpty) {
      return Column(
        children: List.generate(
          selectedOrder.additionsList.length,
          (index) {
            final additions = selectedOrder.additionsList[index];
            return AdditionsCard(
              additions: additions,
              onOptionSelected: (option) => _selectedOptionsList.add(option),
              onOptionUnSelected: (option) =>
                  _selectedOptionsList.remove(option),
            );
          },
        ),
      );
    } else {
      return SizedBox(
        height: 150,
      );
    }
  }
}
