
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Controller/cart_provider.dart';
import 'HomeScreen.dart';
import 'View/Screen/Cart_Screen.dart';
import 'View/Screen/CategoryGropuScreen.dart';
import 'View/Screen/CategorySubGroup.dart';
import 'View/Screen/SearchScreen.dart';
import 'View/Screen/SingleProductDetails.dart';
import 'View/Screen/checkout_screen.dart';
import 'View/Widget/StaggeredGridView.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.white, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CartProvider>.value(
            value: CartProvider(),
          ),
        ],

      child: MaterialApp(
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
          '/': (context) =>
              //MyHomePage(),
              HomeScreen(),
         //'/singelProductDetails': (context) => SingleProdutDetails(),
         '/cartScreen': (context) => CartScreen(),
         '/searchScreen': (context) => SearchScreen(),
         //'/categoryGropuScreen': (context) => CategoryGroupScreen(),
        // '/categorySubGropuScreen': (context) => CategorySubGroupScreen(),
         '/checkoutScreen': (context) => CheckoutScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget
        },
      ),
    );
  }
}