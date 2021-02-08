import 'package:cloud_kitchen/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  TextEditingController _nameCtlr=TextEditingController();

  Widget _textFormField(TextEditingController controller,){
    return TextFormField(
        controller:controller ,
        validator: (value) {
          if (value.isEmpty) {
            return 'প্রয়োজনীয় তথ্য যোগ করুন';
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          border: InputBorder.none,
          fillColor: Colors.white,
          hintText: 'এখানে লিখুন',
        ));
  }

  Widget _title(String text){
    return  Container(
      alignment: Alignment.topLeft,
      child: Text(text,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'SF Pro Text Regular')),
    );
  }

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
              child:Text('Checkout',style:GoogleFonts.roboto(color:Constant.appbarTextColor),) ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 20,left: 20,bottom: 20),
              child:Text('Delivery Address :',style:GoogleFonts.roboto(color:Constant.black,fontSize: 18),)
            ),
            Expanded(
              flex: 5,
              child: Container(
                 child: ListView(
                   children: [
                     //  _title('anem'),
                     // _textFormField(_nameCtlr)
                     Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20),
                       child: Container(
                         height: 200,
                         width: 300,
                         decoration: BoxDecoration(
                             color: Colors.white,
                           borderRadius: BorderRadius.circular(15)
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Text('Payment Method',style:GoogleFonts.roboto(color:Constant.black,fontSize: 16),),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20),
                       child: Container(
                         height: 200,
                         width: 300,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(15)
                         ),
                       ),
                     )
                   ],
                 )
              ),
            ),
            Expanded(
              flex: 1,
                child:  Container(
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
                                child: Text('Proceed to Pay',style:GoogleFonts.roboto(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                              )
                          )
                      ),
                    ],
                  ),
                )
            ),
          ],
        )
      ),
    );
  }
}
