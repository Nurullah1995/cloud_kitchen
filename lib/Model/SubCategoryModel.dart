// To parse this JSON data, do
//
//     final subCategoryMealsModel = subCategoryMealsModelFromJson(jsonString);

import 'dart:convert';

SubCategoryMealsModel subCategoryMealsModelFromJson(String str) => SubCategoryMealsModel.fromJson(json.decode(str));

String subCategoryMealsModelToJson(SubCategoryMealsModel data) => json.encode(data.toJson());

class SubCategoryMealsModel {
  SubCategoryMealsModel({
    this.id,
    this.name,
    this.menuId,
    this.colorCode,
    this.icon,
  });

  int id;
  String name;
  int menuId;
  String colorCode;
  String icon;

  factory SubCategoryMealsModel.fromJson(Map<String, dynamic> json) => SubCategoryMealsModel(
    id: json["id"],
    name: json["name"],
    menuId: json["menu_id"],
    colorCode: json["color_code"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "menu_id": menuId,
    "color_code": colorCode,
    "icon": icon,
  };
}
