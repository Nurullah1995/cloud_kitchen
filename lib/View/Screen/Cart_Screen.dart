import 'package:cloud_kitchen/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List<String> litems = ["1","2","Third","4"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                             itemCount: litems.length,
                             itemBuilder: (BuildContext ctxt, int index) {
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
                                                 Align(
                                                   // These values are based on trial & error method
                                                   alignment: Alignment(1.09, -1.19),
                                                   child: InkWell(
                                                     onTap: () {
                                                       Navigator.pop(context);
                                                     },
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
                                              Container(
                                                  margin: EdgeInsets.only(top: 10),
                                                  child: Text('electronic commerce',style:GoogleFonts.roboto(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)
                                              ),
                                              Container(
                                                  margin: EdgeInsets.only(right: 80,top: 30),
                                                  child:  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                                                        child: Text('৳\150',style:GoogleFonts.roboto(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 20),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text('৳\250',style:GoogleFonts.roboto(color:Colors.black,fontSize: 15,decoration: TextDecoration.lineThrough,),),
                                                      ),
                                                    ],
                                                  ),
                                              ),
                                                 Container(
                                                   margin: EdgeInsets.only(left: 80,top: 60),
                                                   child: Row(
                                                     children: [
                                                       IconButton(
                                                           icon: Icon(Icons.remove_circle_outline_outlined,color:Colors.pink),
                                                           onPressed: (){

                                                           }
                                                       ),
                                                       Container(
                                                         height: 30,
                                                         width: 40,
                                                         child: TextField(
                                                           textAlign:  TextAlign.center,
                                                           decoration: InputDecoration(
                                                               filled: true,
                                                               fillColor: Colors.white,
                                                               border: InputBorder.none,
                                                               hintText: '2',
                                                               hintStyle: TextStyle(color: Colors.purple)
                                                           ),
                                                         ),
                                                       ),
                                                       IconButton(
                                                           icon: Icon(Icons.add_circle_outline_outlined,color: Colors.pink,),
                                                           onPressed: (){

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
        )
    );
  }
}
