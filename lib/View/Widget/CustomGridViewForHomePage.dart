import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomGridViewForHomePage extends StatelessWidget {
    List<dynamic> list;
    int index;
    CustomGridViewForHomePage(this.list,this.index);
  @override
  Widget build(BuildContext context) {
    return Stack(
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
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height/3.8,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Positioned(
          child: Container(
            alignment: Alignment.topLeft,
            child: ClipOval(
              child: Image.network(
                'https://www.authenticfoodquest.com/wp-content/uploads/2017/07/PorkSatay_FoodinSingapore_AuthenticFoodQuest.jpg',
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
            margin:EdgeInsets.only(bottom: 180),
            child: Center(child: Text('25% OFF',style: TextStyle(color: Colors.white),))
        ),
        Container(
            margin:EdgeInsets.only(top: 100),
            child: Center(child: Text(list[index]["name"],style:GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.bold,),))
        ),
        Container(
          margin:EdgeInsets.only(top: 170),
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('৳\ 150',style:GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.amber),),
                  Text('৳\$250',style:GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough,),),
                ],
              )
          ),
        ),
      ],
    );
  }
}
