import 'dart:convert';
import 'dart:io';
import 'package:cloud_kitchen/Model/CategoryMealsModel.dart';
import 'package:cloud_kitchen/Model/MealsModel.dart';
import 'package:cloud_kitchen/Model/SubCategoryModel.dart';
import 'package:http/http.dart' as http;



Future<List<SubCategoryMealsModel>> subCategoryMealsFetch(int id) async {
  // var token=await getTokenValue();
  // print(token);
  http.Response response = await http.get(
      'https://tastewind.com/api/submenus/$id',
      headers:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $token',
      }
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    var responseJson = jsonDecode(response.body);
    var responseData=responseJson['submenus'];
    List<SubCategoryMealsModel> subCategoryList=[];
    for(var item in responseData){
      subCategoryList.add(SubCategoryMealsModel.fromJson(item));
    }
    return subCategoryList;
    // return (responseJson['data'] as List)
    //     .map((p) => FetchVisitedPlaceModel.fromJson(p))
    //     .toList();
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load login authentication');
  }
}