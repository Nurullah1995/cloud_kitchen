import 'package:badges/badges.dart';
import 'package:cloud_kitchen/Util/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'View/Widget/CategoryCard.dart';
import 'View/Widget/CustomGridViewForHomePage.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map> myProducts =
  List.generate(100000, (index) => {"id": index, "name": "Fried chicken $index"})
      .toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Constant.white,
            title: Text('Cloud Kitchen',style:GoogleFonts.roboto(color:Constant.appbarTextColor),),
            leading: IconButton(
              icon: Icon(Icons.menu,color: Colors.black,),
              onPressed: (){
              //  Navigator.pop(context);
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
                        badgeContent: Text('2',style: TextStyle(color: Colors.white),),
                     )
                  ],
                ),
            ],
          ),
          body: Column(
            children: [
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70,
                      width: 250,
                      margin: EdgeInsets.only(left: 20,top: 15),
                      child: Card(
                        elevation: 5,
                        child: TextField(
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(color: Constant.ashcolortext)
                              ),
                              hintText: 'search item',
                              prefixIcon: const Icon(
                                Icons.search,
                                color:Constant.appbarTextColor,
                                size: 35,
                              ),
                          ),
                        ),
                      ),
                      ),
                    Container(
                      margin: EdgeInsets.only(right: 20,top: 10),
                      height: 50,
                      width: 50,
                      child: Card(child: IconButton(
                        icon: Icon(Constant.sort),
                        onPressed: (){},
                      )),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height/6.8,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: CategoryCard(),
              ),
              Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 /5 ,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemCount: myProducts.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, '/singelProductDetails');
                            },
                              child: CustomGridViewForHomePage(myProducts,index)
                          );
                        }),
                  )
              ),
            ],
          ),
        ),
    );
  }
}
