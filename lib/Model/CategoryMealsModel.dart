// To parse this JSON data, do
//
//     final categoryMealsModel = categoryMealsModelFromJson(jsonString);

import 'dart:convert';

CategoryMealsModel categoryMealsModelFromJson(String str) => CategoryMealsModel.fromJson(json.decode(str));

String categoryMealsModelToJson(CategoryMealsModel data) => json.encode(data.toJson());

class CategoryMealsModel {
  CategoryMealsModel({
    this.id,
    this.name,
    this.mealId,
    this.colorCode,
    this.icon,
  });

  int id;
  String name;
  int mealId;
  String colorCode;
  String icon;

  factory CategoryMealsModel.fromJson(Map<String, dynamic> json) => CategoryMealsModel(
    id: json["id"],
    name: json["name"],
    mealId: json["meal_id"],
    colorCode: json["color_code"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "meal_id": mealId,
    "color_code": colorCode,
    "icon": icon,
  };
}
