import 'package:cloud_kitchen/Util/FakeDatabase.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier{


  int _cartitems = 0;
  int item_count=1;


  double update_regularPrice;
  double update_discountPrice;

  List<Product> _cartList = new List<Product>();

  int get items => _cartitems;

  List<Product> get cartList => _cartList;

  void addItemsToCart(Product product)
  {
    _cartList.add(product);
    notifyListeners();
  }

  void deleteItemFromCart(int id)
  {
    for(int i=0; i<= _cartList.length; i++)
      if(_cartList[i].id == id)
        _cartList.removeAt(i);

    notifyListeners();
  }

  set items(int val) {
    _cartitems = val;
    notifyListeners();
  }

  void incrementCart() {
    items = items + 1;
  }

  void decrementCart() {
    items = items - 1;
  }

   // int incretmentCountItem(){
   //  if(item_count>0 && item_count<99){
   //    item_count=item_count+1;
   //    notifyListeners();
   //  }
   //
   // }
   // void decrementCountItem(){
   //   if(item_count>1){
   //     item_count=item_count -1;
   //     notifyListeners();
   //   }
   // }


   void incremtnTest(int id){

     // var indexNo = _cartList.indexWhere((f) => f.id==id);
     // _cartList[indexNo].update(, (v)=>v+1);


   }

  // void updateRegularPriceFunction(List<Product> productlist, int id){
  //
  //   final newindex = _cartList.indexWhere((element) =>
  //   element.id == id);
  //   if (newindex >= 0) {
  //    print('Using indexWhere: ${productlist[newindex].regularPric}');
  //    if(productlist[newindex].regularPric !=null){
  //      update_regularPrice=productlist[newindex].regularPric*item_count;
  //      print(update_regularPrice);
  //      notifyListeners();
  //    }
  //   }
  //
  //  }



  // void updateDiscountPriceFunction(List<Product> productlist, int id){
  //
  //
  //   final newindex = _cartList.indexWhere((element) =>
  //   element.id == id);
  //   if (newindex >= 0) {
  //      print('Using indexWhere: ${productlist[newindex].discountPrice}');
  //      if(productlist[newindex].discountPrice !=null){
  //
  //      }
  //     update_discountPrice=productlist[newindex].discountPrice*item_count;
  //     print(update_discountPrice);
  //     notifyListeners();
  //   }

   //  }



}