import 'package:cloud_kitchen/Util/Constant.dart';
import 'package:cloud_kitchen/Util/FakeDatabase.dart';
import 'package:cloud_kitchen/View/Screen/ProductCategory_screen.dart';
import 'package:flutter/material.dart';


class CategoryCard extends StatelessWidget {
  List<Product> iconlis;
  CategoryCard(this.iconlis);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: iconlis.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Container(
            height: MediaQuery.of(context).size.height/8,
            width: MediaQuery.of(context).size.width/5,
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.height/8,
                  height: MediaQuery.of(context).size.width/6,
                  decoration: new BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.ac_unit,color: Constant.appbarTextColor,),
                    onPressed: (){
                      print('clicked category');
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen()));
                    },
                  ),
                ),
                SizedBox(height: 5,),
                Center(
                  child: Text(iconlis[index].name.substring(1,6).toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          );
        }
    );
  }
}


