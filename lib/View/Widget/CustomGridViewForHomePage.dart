import 'package:cloud_kitchen/Controller/cart_provider.dart';
import 'package:cloud_kitchen/Util/FakeDatabase.dart';
import 'package:cloud_kitchen/View/Screen/SingleProductDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class CustomGridViewForHomePage extends StatelessWidget {
    List<Product> list;
    int index;
    CustomGridViewForHomePage(this.list,this.index,);



  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleProdutDetails(list[index].id)));

          //Navigator.pushNamed(context, '/singelProductDetails',arguments: (list[index].id));
        },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            alignment: Alignment.center,
            //     child: Text(myProducts[index]["name"],style: TextStyle(color: Colors.black),),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20)),
          ),
          Card(
            elevation:0.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height/4,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            child: Container(
              alignment: Alignment.topLeft,
              child: ClipOval(
                child: Image.network(list[index].images[0],
                  fit: BoxFit.cover,
                  height:MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/2,
                ),
              ),
            ),
          ),
          Container(
              height: 30,
              width: 100,
              color: Colors.pink,
              margin:EdgeInsets.only(bottom: MediaQuery.of(context).size.width/2.3,left: 10),
              child: Center(child: Text('25% OFF',style: TextStyle(color: Colors.white),))
          ),
          Container(
              margin:EdgeInsets.only(top: 100,left: 10,right: 4),
              child: Center(child: Text(list[index].name,style:GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.bold,),
                overflow: TextOverflow.ellipsis,
              ))
          ),
           list[index].regularPric!=null?
          Container(
            margin: EdgeInsets.only(top: 200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Expanded(
                        child:Container(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                margin:EdgeInsets.only(top: 20,left: 20),
                                child: Text('৳\'${list[index].discountPrice.toStringAsFixed(2)}',style:GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.amber),),
                              ),
                              Container(
                                alignment: Alignment.bottomLeft,
                                margin:EdgeInsets.only(left: 22),
                               // margin:EdgeInsets.only(bottom: 30,left: 32),
                                child: Text('৳\'${list[index].regularPric.toStringAsFixed(2)}',style:GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough,),),
                              ),
                            ],
                          ),
                        )
                    ),

                  Expanded(
                      child:Container(
                         // alignment: Alignment.bottomRight,
                           margin: EdgeInsets.only(top: 20),
                          child: IconButton(
                            icon:Icon(Icons.add_shopping_cart_outlined,size: 35,color: Colors.deepPurple,),
                            onPressed: (){
                              cartProvider.incrementCart();
                              cartProvider.addItemsToCart(list[index]);
                            },
                          )
                      ),
                  )

                ],
              ),
            )
              :
        Container(
         // alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(top: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin:EdgeInsets.only(top: 20),
                  child: Text('৳\'${list[index].discountPrice.toStringAsFixed(2)}',style:GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.amber),),
                ),
                Container(
                    alignment: Alignment.center,
                   // margin: EdgeInsets.only(right: 30,bottom: 30),
                    child: IconButton(
                      icon:Icon(Icons.add_shopping_cart_outlined,size: 35,color: Colors.deepPurple,),
                      onPressed: (){
                        cartProvider.incrementCart();
                        print(list[index]);
                        cartProvider.addItemsToCart(list[index]);
                        print(cartProvider.cartList);
                      },
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
