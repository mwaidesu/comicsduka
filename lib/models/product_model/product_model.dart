import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String id;
  String name;
  String image;
  double price;
  String description;
  String status;
  bool isFavorite;
  int? qty;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.status,
    required this.isFavorite,
    this.qty,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        qty: json["qty"],
        price: double.parse(json["price"].toString()),
        status: json["status"],
        isFavorite: false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "price": price,
        "status": status,
        "isFavorite": isFavorite,
        "qty": qty,
      };

       @override
  ProductModel copyWith({
  // String? id,
  // String? name,
  // String? image,
  // double? price,
  // String? description,
  // String? status,
  // bool? isFavorite,
  int? qty,
  }) =>
      ProductModel(
        id: id,
        name: name,
        image: image,
        description: description,
        price: price,
        status: status,
        isFavorite: isFavorite,
        qty: qty??this.qty,
      );
}

