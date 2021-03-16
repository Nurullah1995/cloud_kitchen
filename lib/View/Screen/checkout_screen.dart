import 'package:cloud_kitchen/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  TextEditingController _nameCtlr=TextEditingController();

  String groupRadioItem = '';

  Widget _textFormField(TextEditingController controller,){
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: TextFormField(
          controller:controller ,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please? Give some text';
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            border: InputBorder.none,
            fillColor: Colors.white,
            hintText: 'Input Some Text',
          )),
    );
  }

  Widget _title(String text){
    return  Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 20,right: 20),
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
          backgroundColor: Colors.white,
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
                         height:MediaQuery.of(context).size.height/4,
                         width: MediaQuery.of(context).size.width/3,
                         decoration: BoxDecoration(
                             color: Colors.black12,
                           borderRadius: BorderRadius.circular(15)
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Row(
                               children: [
                                 _title('Mobile Number'),
                                 Text('*',style: TextStyle(color: Colors.red),)
                               ],
                             ),
                             _textFormField(_nameCtlr),
                             Row(
                               children: [
                                 _title('Delivery Address(Full)'),
                                 Text('*',style: TextStyle(color: Colors.red),)
                               ],
                             ),
                             _textFormField(_nameCtlr),
                             _title('Address (Goole Map)'),
                             _textFormField(_nameCtlr),
                             SizedBox(height: 10,),
                           ],
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
                         height:MediaQuery.of(context).size.height/4,
                         width: MediaQuery.of(context).size.width/3,
                         decoration: BoxDecoration(
                             color: Colors.black12,
                             borderRadius: BorderRadius.circular(15)
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 30),
                               child: Row(
                                 children: [
                                   Radio(
                                     value: 'Item 1',
                                     groupValue: groupRadioItem,
                                     activeColor: Colors.red,
                                     onChanged: (val){
                                       setState(() {
                                         groupRadioItem = val;
                                         print(groupRadioItem);
                                       });
                                     },
                                   ),
                                   Image.asset('image/money.png',height: 50,width: 50,),
                                   SizedBox(width: 20,),
                                   Text('Cash On Delivery')
                                 ],
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left: 30),
                               child: Row(
                                 children: [
                                   Radio(
                                     value: 'Item 2',
                                     groupValue: groupRadioItem,
                                     activeColor: Colors.red,
                                     onChanged: (val){
                                       setState(() {
                                         groupRadioItem = val;
                                         print(groupRadioItem);
                                       });
                                     },
                                   ),
                                   Image.asset('image/cashless-payment.png',height: 50,width: 50,),
                                   SizedBox(width: 20,),
                                   Text('Online Payment')
                                 ],
                               ),
                             ),
                           ],
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
