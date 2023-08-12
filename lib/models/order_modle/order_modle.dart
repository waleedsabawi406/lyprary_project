

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:library_project/models/product_modle/product_modle.dart';

OrderModle orderModleFromJson(String str)=>
OrderModle.fromJson(json.decode(str));

class OrderModle{
  String payment;
  String status;
  double totalPrice;
  String orderId;
  List<ProductModel> products;
 

  OrderModle({
    required this.totalPrice,
    required this.payment,
    required this.products,
    required this.status,
    required this.orderId,
   
   
  });
  factory OrderModle.fromJson(Map<String,dynamic>json){
    List<dynamic>productMap = json["products"];
    return OrderModle(
      totalPrice: json["totalPrice"],
       payment: json["payment"],
        products: productMap.map((e) => ProductModel.fromJson(e)).toList(),
         status: json["status"],
          orderId:json["orderId"],
          );
  }
  
       
  

  



}