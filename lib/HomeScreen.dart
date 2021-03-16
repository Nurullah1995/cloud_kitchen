import 'package:badges/badges.dart';
import 'package:cloud_kitchen/Util/Constant.dart';
import 'package:cloud_kitchen/Util/FakeDatabase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'Controller/cart_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Model/MealsModel.dart';
import 'Service/meals_service.dart';
import 'View/Screen/CategoryGropuScreen.dart';
import 'View/Screen/ProductCategory_screen.dart';
import 'View/Widget/CategoryCard.dart';
import 'View/Widget/CustomGridViewForHomePage.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   List<MealsModel> mealsList=[];
   bool isloading=false;

   GlobalKey<ScaffoldState> _scffolKey = GlobalKey();

      @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchMeals().then((response) {
      mealsList.addAll(response);
      setState(() {
        isloading=true;
      });
    });
  }


   int _selectedDestination = 0;


   void selectDestination(int index) {
     setState(() {
       _selectedDestination = index;
     });
   }


  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      key: _scffolKey,
     // endDrawerEnableOpenDragGesture: true,
      backgroundColor: Constant.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Constant.white,
        title: Text('Home',style:GoogleFonts.stylish(color:Colors.deepOrange),),
        leading: IconButton(
          icon: Icon(Icons.menu,color: Colors.black,),
          onPressed: () {
            _scffolKey.currentState.openDrawer();
          }
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
                        print(cartProvider.cartList);
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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Header',
                style: GoogleFonts.stylish(color: Colors.black38),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Item 1'),
              selected: _selectedDestination == 0,
              onTap: () => selectDestination(0),
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Item 2'),
              selected: _selectedDestination == 1,
              onTap: () => selectDestination(1),
            ),
            ListTile(
              leading: Icon(Icons.label),
              title: Text('Item 3'),
              selected: _selectedDestination == 2,
              onTap: () => selectDestination(2),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Label',
              ),
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Item A'),
              selected: _selectedDestination == 3,
              onTap: () => selectDestination(3),
            ),
          ],
        ),
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
                  width: MediaQuery.of(context).size.width/1.5,
                  margin: EdgeInsets.only(left: 20,top: 15),
                  child: Card(
                    elevation: 5,
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.transparent,
                        primaryColorDark: Colors.red,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Constant.ashcolortext)
                            ),
                            hintText: 'search item',
                            prefixIcon: const Icon(
                              Icons.search,
                              color:Constant.ashcolortext,
                              size: 35,
                            ),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, '/searchScreen');
                        },
                      ),
                    ),
                  ),
                  ),
                Container(
                  margin: EdgeInsets.only(right: 20,top: 10),
                  height: 50,
                  width: 50,
                  child: Card(child: IconButton(
                    icon: Icon(Constant.sort,color: Colors.red,),
                    onPressed: (){},
                  )),
                )
              ],
            ),
          ),

          // InkWell(
          //   onTap: (){
          //     print('clicked category I');
          //    // Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen()));
          //   },
          //   child: Container(
          //     height: MediaQuery.of(context).size.height/6.8,
          //     width: MediaQuery.of(context).size.width,
          //     color: Colors.white,
          //     child: CategoryCard(_productList),
          //   ),
          // ),
          Expanded(
              child: isloading==false?Center(child: SpinKitPouringHourglass(color: Colors.red)):Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                child:StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  itemCount: mealsList.length,
                  itemBuilder: (BuildContext context, int index) {
                   String color='0xff${mealsList[index].colorCode}';
                   // String color=Color(0xff765432);
                   return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryGroupScreen(mealsList[index].id)));
                      },
                      child: new Container(
                          decoration: BoxDecoration(
                              color: Color(int.parse(color)),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(2, 4), // Shadow position
                              ),
                            ],
                          ),
                          //  color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30,right: 30),
                                child: Image.network(mealsList[index].icon,height: 100,width: 100,color: Colors.white,),
                              ),
                              // icons[index],
                              //  ImageIcon(icons[index],size: 100,color: Colors.black,),
                              SizedBox(height: 30,),
                              Padding(
                                padding: const EdgeInsets.only(left: 25,right: 25),
                                child: Center(child: Text(mealsList[index].name,style: GoogleFonts.stylish(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20),)),
                              ),
                            ],
                          )
                      ),
                    );
                  },
                  staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(1, index.isEven ? 1.2 : 1.8),
                  // mainAxisSpacing: 4.0,
                  // crossAxisSpacing: 4.0,
                )
              )
          ),
        ],
      ),
    );
  }

}
