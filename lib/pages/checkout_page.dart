import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:flutterwave/utils/flutterwave_constants.dart';
import 'package:flutterwave/utils/flutterwave_currency.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckoutPage extends StatefulWidget {
  final String restaurantName;
  final String deliveryTime;
  final double total;

  CheckoutPage({
    required this.restaurantName,
    required this.deliveryTime,
    required this.total,
  });

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final String txref = "My_unique_transaction_reference_123";
  final String currency = FlutterwaveCurrency.GHS;

  String get amount => widget.total.toString();

  @override
  Widget build(BuildContext context) {
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
              'Checkout',
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
                      'Deliver in ${widget.deliveryTime} min',
                      textScaleFactor: 1.2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(
              'Deliver to',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962),
              ),
              markers: <Marker>{
                Marker(
                  markerId: MarkerId('value'),
                  position: LatLng(37.42796133580664, -122.085749655962),
                ),
              },
            ),
          ),
          SizedBox(height: 8.0),
          ListTile(
            leading: Icon(
              Entypo.location_pin,
              // size: 16.0,
              color: Colors.grey,
            ),
            title: Text(
              '99 Thompson Road',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            subtitle: Text(
              'Lekki\n'
              'Lagos State, Nigeria',
            ),
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
                    '£${widget.total.toStringAsFixed(2)}',
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
                  'Place delivery order',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {},
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

  void _beginPayment() async {
    final Flutterwave flutterwave = Flutterwave.forUIPayment(
      context: this.context,
      encryptionKey: 'FLWSECK_TEST8b66aa65f18d',
      publicKey: 'FLWPUBK_TEST-557da058e056af052cca795ba2acd9da-X',
      currency: this.currency,
      amount: widget.total.toString(),
      email: "valid@email.com",
      fullName: "Valid Full Name",
      txRef: this.txref,
      isDebugMode: true,
      phoneNumber: "0123456789",
      acceptCardPayment: true,
      acceptGhanaPayment: true,
    );

    try {
      final ChargeResponse? response =
          await flutterwave.initializeForUiPayments();
      if (response == null) {
        // user didn't complete the transaction. Payment wasn't successful.
      } else {
        final isSuccessful = _checkPaymentIsSuccessful(response);
        if (isSuccessful) {
          // provide value to customer
        } else {
          // check message
          print(response.message);

          // check status
          print(response.status);

          // check processor error
          print(response.data!.processorResponse);
        }
      }
    } catch (error, stacktrace) {
      // handleError(error);
      print(stacktrace);
    }
  }

  bool _checkPaymentIsSuccessful(ChargeResponse response) {
    return response.data!.status == FlutterwaveConstants.SUCCESSFUL &&
        response.data!.currency == this.currency &&
        response.data!.amount == this.amount &&
        response.data!.txRef == this.txref;
  }
}
