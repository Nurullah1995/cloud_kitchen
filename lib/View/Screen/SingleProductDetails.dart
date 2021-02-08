import 'package:badges/badges.dart';
import 'package:cloud_kitchen/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SingleProdutDetails extends StatefulWidget {
  @override
  _SingleProdutDetailsState createState() => _SingleProdutDetailsState();
}

class _SingleProdutDetailsState extends State<SingleProdutDetails> {

   final String des='The definition of a description is a statement that gives details about someone or something. An example of description is a story about the places visited on a family trip. .';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
           appBar: AppBar(
             backgroundColor: Colors.white,
             title: Text('Cloud Kitchen',style:GoogleFonts.roboto(color:Constant.appbarTextColor),),
             leading: IconButton(
               icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
               onPressed: (){
                 Navigator.pop(context);
               },
             ),
             actions: [
               Stack(
                 children: [
                   Container(
                     margin: EdgeInsets.only(top: 10,right: 10),
                     height: 40,
                     width: 40,
                     child: IconButton(
                       icon: Icon(Icons.shopping_cart,color: Colors.black,),
                       onPressed: (){

                       },
                     ),
                   ),
                   Badge(
                     alignment: Alignment.topRight,
                     badgeContent: Text('2',style: TextStyle(color: Colors.white),),
                   )
                 ],
               ),
             ],
           ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Image.network('https://www.authenticfoodquest.com/wp-content/uploads/2017/07/PorkSatay_FoodinSingapore_AuthenticFoodQuest.jpg',
                  height: MediaQuery.of(context).size.height/2.5,
                  width: MediaQuery.of(context).size.width,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Text('Product Name',style:GoogleFonts.roboto(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: (){

                            }
                        ),
                        Container(
                          height: 40,
                          width: 50,
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
                            icon: Icon(Icons.add),
                            onPressed: (){

                            }
                        ),
                      ],
                    ),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                        child: Text('৳\150',style:GoogleFonts.roboto(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 25),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('৳\250',style:GoogleFonts.roboto(color:Colors.black,fontSize: 18,decoration: TextDecoration.lineThrough,),),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      color: Colors.white,
                      textColor: Colors.red,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {},
                      child: Text(
                        "Add to Cart".toUpperCase(),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Text('Description',style:GoogleFonts.roboto(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Text(des,style:GoogleFonts.roboto(color:Colors.black,fontSize: 16,),),
              ),
              SizedBox(height: 50,),
              Center(
                child: MaterialButton(
                  height: 50,
                  minWidth: MediaQuery.of(context).size.width*0.8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cartScreen');
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text("Checkout".toUpperCase(),
                      style: TextStyle(fontSize: 14)),
                ),
              ),
            ],
          ),
        )
    );
  }
}
