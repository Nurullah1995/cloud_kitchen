import 'package:badges/badges.dart';
import 'package:cloud_kitchen/Controller/cart_provider.dart';
import 'package:cloud_kitchen/Util/Constant.dart';
import 'package:cloud_kitchen/Util/FakeDatabase.dart';
import 'package:cloud_kitchen/View/Widget/CustomGridViewForHomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  

  FakeDatabase fakeDb=FakeDatabase();
  List<Product>  _productList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productList=fakeDb.productList;
    print(_productList[0].discountPrice);

  }

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Constant.white,
        title: Text('Food Category',style:GoogleFonts.roboto(color:Constant.appbarTextColor),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: (){
              Navigator.pop(context);
          },
        ),
        actions: [
          // if (_cartList.length > 0)
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10,right: 10),
                height: 40,
                width: 40,
                child: IconButton(
                  icon: Icon(Icons.shopping_cart,color: Colors.black,),
                  onPressed: (){
                    Navigator.pushNamed(context, '/cartScreen');
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
      body: Padding(
        padding: EdgeInsets.all(15),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 /5 ,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: _productList.length,
            itemBuilder: (BuildContext ctx, index) {
              return CustomGridViewForHomePage(_productList,index);
            }),
      ),
    );
  }
}
