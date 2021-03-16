import 'package:cloud_kitchen/Util/FakeDatabase.dart';
import 'package:cloud_kitchen/View/Widget/CustomGridViewForHomePage.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

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
        padding: const EdgeInsets.all(15.0),
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
