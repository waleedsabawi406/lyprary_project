

import 'dart:convert';

ProductModel productModelFromJson(String str)=>
ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data)=> json.encode(data.toJson());

class ProductModel{
  String image;
  String id;
  bool isFavourite;
  String name;
  double price;
  String description;

  int? qty;

  ProductModel({
   required this.image,
   required this.id,
   required this.name,
   required this.price,
   required this.description,
   required this.isFavourite,
   this.qty,
  });
  factory ProductModel.fromJson(Map<String,dynamic>json)=>ProductModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    isFavourite: false,
    price: double.parse(json["price"].toString()),
    qty:json["qty"]
  );

  Map<String,dynamic>toJson()=>{
    "id":id,
    "name":name,
    "description":description,
    "image":image,
    "price":price,
    "qty":qty,

  };
  
  ProductModel copyWith({
    int?qty,
  })=>
  ProductModel(
   image: image,
   id: id,
   name: name, 
   price: price,
   qty: qty??this.qty ,
   description: description,
   isFavourite: isFavourite);

}