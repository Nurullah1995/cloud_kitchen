import 'dart:convert';
import 'dart:io';
import 'package:cloud_kitchen/Model/MealsModel.dart';
import 'package:http/http.dart' as http;



Future<List<MealsModel>> fetchMeals() async {
 // var token=await getTokenValue();
 // print(token);
  http.Response response = await http.get(
    'https://tastewind.com/api/meals',
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
   var responseData=responseJson['meals'];
    List<MealsModel> melasList=[];
    for(var item in responseData){
      melasList.add(MealsModel.fromJson(item));
    }
   //  print(responseJson);
    print(melasList[0].name);
    return melasList;
    // return (responseJson['data'] as List)
    //     .map((p) => FetchVisitedPlaceModel.fromJson(p))
    //     .toList();
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load login authentication');
  }
}