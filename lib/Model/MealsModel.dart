// To parse this JSON data, do
//
//     final mealsModel = mealsModelFromJson(jsonString);

import 'dart:convert';

MealsModel mealsModelFromJson(String str) => MealsModel.fromJson(json.decode(str));

String mealsModelToJson(MealsModel data) => json.encode(data.toJson());

class MealsModel {
  MealsModel({
    this.id,
    this.name,
    this.storeId,
    this.colorCode,
    this.icon,
  });

  int id;
  String name;
  int storeId;
  String colorCode;
  String icon;

  factory MealsModel.fromJson(Map<String, dynamic> json) => MealsModel(
    id: json["id"],
    name: json["name"],
    storeId: json["store_id"],
    colorCode: json["color_code"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "store_id": storeId,
    "color_code": colorCode,
    "icon": icon,
  };
}
