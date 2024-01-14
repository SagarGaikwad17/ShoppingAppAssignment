// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  String? name;
  String? gender;
  int? category;

  double? price;
  bool? fav;
  double? rating;
  String? image;
  int? id;
  int? qty;

  ProductModel(
      {this.name,
      this.gender,
      this.category,
      this.price,
      this.fav,
      this.rating,
      this.image,
      this.id,this.qty});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        gender: json["gender"],
        category: json["category"],
        price: json["price"].toDouble(),
        fav: json["fav"],
        rating: json["rating"]?.toDouble(),
        image: json["image"],
        id: json["id"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "category": category,
        "price": price,
        "fav": fav,
        "rating": rating,
        "image": image,
        "id": id,
        "qty":qty
      };
}
