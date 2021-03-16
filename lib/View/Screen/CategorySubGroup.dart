import 'package:cloud_kitchen/Model/SubCategoryModel.dart';
import 'package:cloud_kitchen/Service/SubCategory_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySubGroupScreen extends StatefulWidget {
  int subCategoryId;
  CategorySubGroupScreen(this.subCategoryId);
  @override
  _CategorySubGroupScreenState createState() => _CategorySubGroupScreenState();
}

class _CategorySubGroupScreenState extends State<CategorySubGroupScreen> {

  List<SubCategoryMealsModel> subGroupCategoryList=[];
  bool isloading=false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subCategoryMealsFetch(widget.subCategoryId)
        .then((response) {
      subGroupCategoryList.addAll(response);
      setState(() {
        isloading=true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body:isloading==false?Center(child: SpinKitPouringHourglass(color: Colors.red)):Container(
          margin: EdgeInsets.only(left: 20,right: 20,top: 20),
          child:StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 12,
            itemCount: subGroupCategoryList.length,
            itemBuilder: (BuildContext context, int index) {
              String color='0xff${subGroupCategoryList[index].colorCode}';
              // String color=Color(0xff765432);
              return InkWell(
                onTap: (){
                 // Navigator.pushNamed(context,'/' );
                  Navigator.pushNamed(context, '/searchScreen');
                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>CategorySubGroupScreen(subGroupCategoryList[index].id)));
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
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                    ),
                    //  color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30,right: 30),
                          child: Image.network(subGroupCategoryList[index].icon,height: 100,width: 100,color: Colors.white,),
                        ),
                        // icons[index],
                        //  ImageIcon(icons[index],size: 100,color: Colors.black,),
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.only(left: 25,right: 25),
                          child: Center(child: Text(subGroupCategoryList[index].name,style: GoogleFonts.stylish(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20),)),
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
    );
  }
}
