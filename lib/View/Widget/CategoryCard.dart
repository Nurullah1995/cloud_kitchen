import 'package:cloud_kitchen/Util/Constant.dart';
import 'package:flutter/material.dart';


class CategoryCard extends StatelessWidget {
  List<String> litems = ["Third","Third","Third","Third","Third","Third","Third","Third","Third",];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: litems.length,
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
                    onPressed: (){},
                  ),
                ),
                SizedBox(height: 5,),
                Text(litems[index]),
              ],
            )
          );
        }
    );
  }
}


