
import 'dart:convert';

import 'package:prueba_tecnica/features/products/domain/entities/product.dart';

List<ProductModel> productModelFromJson(List<dynamic> jsonList) {
  return jsonList
      .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
      .toList();
}

String productToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class ProductModel extends Product {

  ProductModel({
    required super.id,
    required super.name,
    required super.brand,
    required super.weight,
    required super.price,
    super.originalPrice,
    required super.onSale,
    required super.image,
  }) ;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    brand: json["brand"],
    weight: json["weight"],
    price: json["price"]?.toDouble(),
    originalPrice: json["originalPrice"]?.toDouble(),
    onSale: json["onSale"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "brand": brand,
    "weight": weight,
    "price": price,
    "originalPrice": originalPrice,
    "onSale": onSale,
    "image": image,
  };
}
