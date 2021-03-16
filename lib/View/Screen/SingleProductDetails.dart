import 'package:badges/badges.dart';
import 'package:cloud_kitchen/Controller/cart_provider.dart';
import 'package:cloud_kitchen/Util/Constant.dart';
import 'package:cloud_kitchen/Util/FakeDatabase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class SingleProdutDetails extends StatefulWidget {
   final int id;
   SingleProdutDetails(this.id);
  @override
  _SingleProdutDetailsState createState() => _SingleProdutDetailsState();
}

class _SingleProdutDetailsState extends State<SingleProdutDetails> {
    FakeDatabase fakeDb=FakeDatabase();
   List<Product> _productlist;
   int singleItemIndex;

     @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productlist=fakeDb.productList;
    _foundsingleProduct(widget.id);
  }

    void _foundsingleProduct(int id) {
      // Find the index of person. If not found, index = -1
      singleItemIndex = _productlist.indexWhere((element) =>
      element.id == id);
      if (singleItemIndex >= 0) {
        print('Using indexWhere: ${_productlist[singleItemIndex]}');
      }
    }


 List  testlist=   [
    'https://post.healthline.com/wp-content/uploads/2020/07/pizza-beer-1200x628-facebook-1200x628.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrujTIh34DwL4EZ45x_KcC8HpVsjDTZEqlqA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIUMMOAmAGPx_jq66Ii5uviwTFUvddS7dr_g&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz4189rCWG096sCXhtXkSIbX3H19LC81P8kg&usqp=CAU',
    'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg',
    'https://www.refrigeratedfrozenfood.com/ext/resources/NEW_RD_Website/DefaultImages/default-pasta.jpg?1430942591',
    'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg'
    ];


  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
       backgroundColor: Colors.white,
       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0.0,
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
                 badgeContent: Text(cartProvider.items.toString()==null?'0':cartProvider.items.toString(),style: TextStyle(color: Colors.white),),
               )
             ],
           ),
         ],
       ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Image.network(_productlist[singleItemIndex].images[0],
              height: MediaQuery.of(context).size.height/3.5,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Container(
              height: MediaQuery.of(context).size.height/8,
              width: double.maxFinite,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                   itemCount: testlist.length,
                  itemBuilder: (BuildContext context, int index){
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: InkWell(
                          onTap: (){
                             setState(() {
                               _productlist[singleItemIndex].images[0]=testlist[index];
                             });
                          },
                         child: Image.network(testlist[index],fit: BoxFit.contain,)
                     ),
                   );
                  }
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/1.6,
              //  color: Colors.red,
                padding: const EdgeInsets.only(left: 20,right: 10),
                child: Text(_productlist[singleItemIndex].name,style:GoogleFonts.roboto(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: (){
                       //cartProvider.decrementCountItem();
                           print('clicked decremtnt');
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
                        icon: Icon(Icons.add),
                        onPressed: (){
                       //  cartProvider.incretmentCountItem();
                           //print('clicked increment');
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
                    child: Text('৳\'${_productlist[singleItemIndex].discountPrice.toStringAsFixed(2)}',style:GoogleFonts.roboto(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 25),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_productlist[singleItemIndex].regularPric!=null?'৳\'${_productlist[singleItemIndex].regularPric.toStringAsFixed(2)}':'',style:GoogleFonts.roboto(color:Colors.black,fontSize: 18,decoration: TextDecoration.lineThrough,),),
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
                  onPressed: () {
                    cartProvider.incrementCart();
                  },
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
            child: Text(_productlist[singleItemIndex].description,style:GoogleFonts.roboto(color:Colors.black,fontSize: 16,),),
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
    );
  }
}
