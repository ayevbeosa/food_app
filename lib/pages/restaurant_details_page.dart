import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_app/db/app_database.dart';
import 'package:food_app/db/basket_with_additions.dart';
import 'package:food_app/dummy/order.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/pages/add_item_page.dart';
import 'package:food_app/pages/basket_page.dart';
import 'package:food_app/pages/restaurant_info_page.dart';
import 'package:food_app/rest/api/api_repository.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/custom_search_hint_delegate.dart';
import 'package:food_app/widgets/food_item_container.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class RestaurantDetailsPage extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantDetailsPage({required this.restaurant});

  @override
  _RestaurantDetailsPageState createState() => _RestaurantDetailsPageState(
        this.restaurant,
      );
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {
  final Restaurant _restaurant;

  List<Tab> _tabs = [];

  List<String> _categories = [];
  final ScrollController _sliverScrollController = ScrollController();
  var _isPinned = false;
  final List<Order> orderList = Order.orders;

  _RestaurantDetailsPageState(this._restaurant);

  @override
  void initState() {
    _categories = _restaurant.categories.split(',');
    _tabs = _restaurant.orderCategories
        .split(',')
        .map((e) => Tab(text: e))
        .toList();
    super.initState();

    _sliverScrollController.addListener(_sliverScrollControllerListener);
  }

  @override
  void dispose() {
    _sliverScrollController.removeListener(_sliverScrollControllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final basketsDao = context.select((AppDatabase value) => value.basketsDao);

    return WillPopScope(
      onWillPop: () async {
        basketsDao.clearTables();

        return true;
      },
      child: Scaffold(
        body: DefaultTabController(
          length: _tabs.length,
          child: CustomScrollView(
            shrinkWrap: true,
            controller: _sliverScrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                elevation: 8,
                pinned: true,
                backgroundColor: _isPinned ? kPrimaryColor : Colors.white,
                title: _isPinned
                    ? Text(
                        _restaurant.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    : Text(''),
                leading: Ink(
                  decoration: ShapeDecoration(
                    color: _isPinned ? null : Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    color: _isPinned ? Colors.white : kPrimaryColor,
                    icon: Icon(AntDesign.arrowleft),
                    onPressed: () {
                      basketsDao
                          .clearTables()
                          .whenComplete(() => Navigator.of(context).pop());
                    },
                  ),
                ),
                actions: [
                  Ink(
                    decoration: ShapeDecoration(
                      color: _isPinned ? null : Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      color: _isPinned ? Colors.white : kPrimaryColor,
                      icon: Icon(AntDesign.sharealt),
                      onPressed: () {
                        Share.share('Share me!');
                      },
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Ink(
                    decoration: ShapeDecoration(
                      color: _isPinned ? null : Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      color: _isPinned ? Colors.white : kPrimaryColor,
                      icon: Icon(AntDesign.search1),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: CustomSearchHintDelegate(
                            hintText: 'Search dishes or categories',
                          ),
                        );
                      },
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Swiper(
                    itemCount: _restaurant.images.length,
                    itemBuilder: (context, index) {
                      return Hero(
                        tag: index == 0
                            ? _restaurant.name
                            : "${_restaurant.name}index",
                        transitionOnUserGestures: true,
                        createRectTween: _createRectTween,
                        child: Image.network(
                          ApiRepository.baseUrl + _restaurant.images[index],
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      );
                    },
                    pagination: SwiperPagination(),
                    autoplay: true,
                    loop: true,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: 16),
                      Text(
                        _restaurant.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 16),
                      Wrap(
                        children: List.generate(
                          _categories.length,
                          (index) => Chip(
                            label: Text(_categories[index]),
                          ),
                        ),
                        spacing: 8.0,
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Entypo.location_pin,
                                    size: 16.0,
                                    color: Colors.grey,
                                  ),
                                  alignment: PlaceholderAlignment.bottom,
                                ),
                                TextSpan(
                                  text:
                                      ' ${_restaurant.distanceFromUserLocation} miles away',
                                ),
                                TextSpan(text: ' • ${_restaurant.address}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        _restaurant.notes,
                        style: TextStyle(
                          height: 1.3,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: double.parse(_restaurant.rating),
                            itemSize: 16.0,
                            itemBuilder: (BuildContext context, int index) {
                              return Icon(
                                AntDesign.star,
                                color: kPrimaryColor,
                              );
                            },
                          ),
                          SizedBox(width: 8.0),
                          Text(_restaurant.rating),
                          Text(
                            ' (${_restaurant.noOfReviews})',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(AntDesign.infocirlceo, color: kPrimaryColor),
                          ],
                        ),
                        title: Text('Restaurant info'),
                        subtitle: Text('Email, Call, Additional help'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RestaurantInfoPage(
                                email: _restaurant.email,
                                notes: _restaurant.notes,
                                phoneNumber: _restaurant.phone,
                                restaurantName: _restaurant.name,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      Container(
                        child: TabBar(
                          tabs: _tabs,
                          isScrollable: true,
                          labelColor: kPrimaryColor,
                          indicator: UnderlineTabIndicator(
                            borderSide: const BorderSide(
                              width: 2.0,
                              color: kBackgroundColor,
                            ),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 100.0 * orderList.length,
                  child: TabBarView(
                    children: [
                      _buildOrderList(),
                      _buildOrderList(),
                      _buildOrderList(),
                      _buildOrderList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: StreamBuilder<List<BasketWithAdditions>>(
          stream: basketsDao.getItemsFromBasket(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return SizedBox(height: 2.0);
              case ConnectionState.waiting:
                return SizedBox(height: 2.0);
              case ConnectionState.active:
                if (snapshot.data!.isNotEmpty) {
                  final double subTotal = snapshot.data!.fold(
                    0.0,
                    (prev, curr) => prev + curr.basket.price,
                  );
                  return Padding(
                    padding: kPadding16To8,
                    child: ElevatedButton(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'View basket',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            '£${subTotal.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BasketPage(
                              restaurantName: _restaurant.name,
                              subTotal: subTotal,
                              deliveryTime: _restaurant.deliveryTime,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50.0),
                      ),
                    ),
                  );
                } else {
                  return SizedBox(height: 2.0);
                }
              case ConnectionState.done:
                if (snapshot.data!.isNotEmpty) {
                  final double subTotal = snapshot.data!.fold(
                    0.0,
                    (prev, element) =>
                        prev +
                        element.basket.price +
                        element.additionItems.fold<double>(
                          0.0,
                          (prev, additionsWithOptions) =>
                              prev +
                              additionsWithOptions.optionItems.fold(
                                0.0,
                                (prev, option) => prev + option.price,
                              ),
                        ),
                  );
                  return Padding(
                    padding: kPadding16To8,
                    child: ElevatedButton(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'View basket',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            '£$subTotal',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BasketPage(
                              restaurantName: _restaurant.name,
                              subTotal: subTotal,
                              deliveryTime: _restaurant.deliveryTime,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50.0),
                      ),
                    ),
                  );
                } else {
                  return SizedBox(height: 2.0);
                }
            }
          },
        ),
      ),
    );
  }

  Widget _buildOrderList() {
    return Column(
      children: List.generate(
        orderList.length,
        (index) => FoodItemContainer(
          order: orderList[index],
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddItemPage(order: orderList[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  void _sliverScrollControllerListener() {
    if (!_isPinned &&
        _sliverScrollController.hasClients &&
        _sliverScrollController.offset > kToolbarHeight) {
      setState(() {
        _isPinned = true;
      });
    } else if (_isPinned &&
        _sliverScrollController.hasClients &&
        _sliverScrollController.offset < kToolbarHeight) {
      setState(() {
        _isPinned = false;
      });
    }
  }

  static RectTween _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }
}
