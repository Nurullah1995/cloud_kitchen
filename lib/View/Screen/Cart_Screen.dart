import 'package:cloud_kitchen/Controller/cart_provider.dart';
import 'package:cloud_kitchen/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var count_test=0;

  void incrementTest(){
    count_test=count_test+1;
  }


  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 35, maxWidth: 200),
              child:Text('Cart',style:GoogleFonts.roboto(color:Constant.appbarTextColor),) ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
      ),
      body: Column(
        children: [
               Expanded(
                 flex: 8,
                   child: Container(
                      //color: Colors.black,
                     child: ListView.builder
                       (
                         itemCount: cartProvider.cartList.length,
                         itemBuilder: (BuildContext ctxt, int index) {
                         var reularPrice=  cartProvider.cartList[index].regularPric!=null?cartProvider.cartList[index].regularPric.toStringAsFixed(2):'';

                           return Padding(
                             padding: const EdgeInsets.only(left: 15,right: 15,top: 3,bottom: 3),
                             child: Card(
                               child: Row(
                                 children: [
                                   Expanded(
                                     flex:2,
                                       child: Container(
                                         child: Padding(
                                           padding: const EdgeInsets.all(10.0),
                                           child: Container(
                                               width: 80.0,
                                               height: 80.0,
                                               decoration: new BoxDecoration(
                                                   shape: BoxShape.circle,
                                                   image: new DecorationImage(
                                                       fit: BoxFit.fill,
                                                       image: new NetworkImage(
                                                           "https://www.authenticfoodquest.com/wp-content/uploads/2017/07/PorkSatay_FoodinSingapore_AuthenticFoodQuest.jpg")
                                                   )
                                               )),
                                         ),
                                       )
                                   ),
                                   Expanded(
                                       flex:4,
                                       child:Container(
                                         child:Stack (
                                           children: [
                                             InkWell(
                                               onTap:(){
                                                 print('clicked delete button');
                                                 cartProvider.deleteItemFromCart(cartProvider.cartList[index].id);
                                                 cartProvider.decrementCart();
                                               },
                                               child: Container(
                                                 child: Align(
                                                   // These values are based on trial & error method
                                                   alignment: Alignment(1.09, -1.19),
                                                   child: Container(
                                                     decoration: BoxDecoration(
                                                       color: Colors.black,
                                                       borderRadius: BorderRadius.circular(12),
                                                     ),
                                                     child: Icon(
                                                       Icons.close,
                                                       color: Colors.white,
                                                     ),
                                                   ),
                                                 ),
                                               ),
                                             ),
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text(cartProvider.cartList[index].name,style:GoogleFonts.roboto(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              )
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 40,left: 2),
                                              child:  Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(cartProvider.update_discountPrice!=null?cartProvider.update_discountPrice.toStringAsFixed(2):cartProvider.cartList[index].discountPrice.toStringAsFixed(2),style:GoogleFonts.roboto(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 20),),
                                                  SizedBox(width: 10,),
                                                  Text(cartProvider.update_regularPrice!=null?'৳${cartProvider.update_regularPrice.toStringAsFixed(2)}':reularPrice,style:GoogleFonts.roboto(color:Colors.black,fontSize: 15,decoration: TextDecoration.lineThrough,),),
                                                ],
                                              ),
                                          ),
                                             Container(
                                               alignment: Alignment.bottomRight,
                                               margin: EdgeInsets.only(top: 50),
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.end,
                                                 children: [
                                                   IconButton(
                                                       icon: Icon(Icons.remove_circle_outline_outlined,color:Colors.pink),
                                                       onPressed: (){
                                                         //  cartProvider.decrementCountItem();
                                                           // cartProvider.updateDiscountPriceFunction(cartProvider.cartList,cartProvider.cartList[index].id);
                                                           // cartProvider.updateRegularPriceFunction(cartProvider.cartList,cartProvider.cartList[index].id);
                                                       }
                                                   ),
                                                   Container(
                                                     height: 30,
                                                     width: 40,
                                                     child: TextField(
                                                       textAlign:  TextAlign.center,
                                                       decoration: InputDecoration(
                                                           filled: true,
                                                           fillColor: Colors.white60,
                                                          // border: InputBorder.none,
                                                           hintText: cartProvider.item_count.toString(),
                                                          hintStyle: TextStyle(color: Colors.red),
                                                           contentPadding: EdgeInsets.only(top: 5),
                                                           border: OutlineInputBorder(),
                                                           labelStyle: TextStyle(
                                                             color: Colors.red,
                                                             fontSize: 24.0
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                   IconButton(
                                                       icon: Icon(Icons.add_circle_outline_outlined,color: Colors.pink,),
                                                       onPressed: (){
                                                         cartProvider.incremtnTest(cartProvider.cartList[index].id);
                                                         //cartProvider.incretmentCountItem();
                                                          // cartProvider.updateDiscountPriceFunction(cartProvider.cartList,cartProvider.cartList[index].id);
                                                          // cartProvider.updateRegularPriceFunction(cartProvider.cartList,cartProvider.cartList[index].id);
                                                       }
                                                   ),
                                                 ],
                                               ),
                                             )
                                           ],
                                         ),
                                       )
                                   )
                                 ],
                               )
                             ),
                           );
                         }
                     )
                   )
               ),
          Expanded(
              flex: 1,
              child: Container(
                   color: Colors.black12,
                   child: Row(
                     children: [
                           Expanded(
                               child: Container(
                                 margin: EdgeInsets.only(left: 10),
                                   child: Row(
                                     children: [
                                       Text('Total:  ',style:GoogleFonts.roboto(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                       Text('৳\150',style:GoogleFonts.roboto(color:Colors.amber,fontSize: 25,fontWeight: FontWeight.bold),),
                                     ],
                                   )
                               )
                           ),
                       Expanded(
                           child: Container(
                               margin: EdgeInsets.only(right: 10),
                              child: RaisedButton(
                                   color: Colors.pink,
                                  onPressed: (){
                                     Navigator.pushNamed(context, '/checkoutScreen');
                                  },
                                  child: Text('Checkout',style:GoogleFonts.roboto(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                              )
                           )
                       ),
                     ],
                   ),
              )
          ),
        ],
      ),
    );
  }
}
