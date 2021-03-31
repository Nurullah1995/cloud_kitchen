import 'package:cloud_kitchen/Service/ProductList_service.dart';
import 'package:cloud_kitchen/Util/FakeDatabase.dart';
import 'package:cloud_kitchen/View/Widget/CustomGridViewForHomePage.dart';
import 'package:flutter/material.dart';

import 'SingleProductDetails.dart';

class ProductListScreen extends StatefulWidget {
    final int subMenuId;
    ProductListScreen(this.subMenuId);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProductList(widget.subMenuId);

  }

  List<String> images = ["https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any"];
  final List<String> items = <String>[
    "Demo Item one",
    "Demo Item two",
    "Demo Item Three",
    "Demo Item four",
    "Demo Item Five",
    "Demo Item six",
    "Demo Item seven",
    "Demo Item eight",
    "Demo Item nine",
    "Demo Item Ten",
    "Demo Item eleven",
    "Demo Item twelve"
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) /2;
    final double itemWidth = size.width /2;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
            leading: IconButton(
               icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
              onPressed: (){
                 Navigator.pop(context);
              },
            ),

           title: TextField(
             decoration: InputDecoration(
               filled: true,
               border: InputBorder.none,
               fillColor: Colors.white,
               hintText: 'Search Item',
               hintStyle: TextStyle(color: Colors.black),
               suffixIcon: IconButton(
                 icon: Icon(
                   Icons.search_outlined,
                 ),
                 onPressed: (){
                   setState(() {
                   });
                 },
               ),
             ),
           ),

        ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (itemWidth / itemHeight),
          controller: new ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: items.map((String value) {
            return InkWell(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleProdutDetails(2)));
                 },
              child: new Container(
                decoration: BoxDecoration(
                    color: Colors.white60,
                    // border: Border.all(
                    //   color: Colors.red[500],
                    // ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
               // color: Colors.green,
                margin: new EdgeInsets.all(1.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('image/demoImage.png',height: MediaQuery.of(context).size.height/6,width:double.infinity,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Hi,I am Md.Nurullah ahmed, recently im working in sManager'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('550',style: TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.normal),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,bottom: 5),
                      child: Text('320',style: TextStyle(color: Colors.amber,fontWeight:FontWeight.bold),),
                    ),
                    InkWell(
                       onTap: (){
                         print('add to cart');
                       },
                      child: Container(
                         height: 25,
                         width:100,
                          color: Colors.pink,
                          child: Center(child: Text('add To Cart',style: TextStyle(color: Colors.white),))
                      ),
                    ),
                  ],
                )
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
