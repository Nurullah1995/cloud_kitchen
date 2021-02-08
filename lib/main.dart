import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'View/Screen/Cart_Screen.dart';
import 'View/Screen/SingleProductDetails.dart';
import 'View/Screen/checkout_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cloud Kitchen',
      theme:ThemeData(
        // primaryColor: Constant.primaryTextColorGray,
        // accentColor: Color(0xff39B54A),
        // textTheme: TextTheme(bodyText2: TextStyle(color:Constant.textColorWhite)),
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => HomeScreen(),
       '/singelProductDetails': (context) => SingleProdutDetails(),
       '/cartScreen': (context) => CartScreen(),
       '/checkoutScreen': (context) => CheckoutScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget
      },
    );
  }
}