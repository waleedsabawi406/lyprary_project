

// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:library_project/constants/constants.dart';
import 'package:library_project/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:library_project/firebase_helper/firebase_storge_firebasehelber/firebase_storge_firebasehelber.dart';
import 'package:library_project/models/product_modle/product_modle.dart';

import '../models/user_modle/user_modle.dart';

class AppProvider with ChangeNotifier{
  final List<ProductModel> _cartProductList =[];
  final List<ProductModel> _buyProductList =[];

   UserModle? _userModle;
    // UserModle get getUserInformation=> _userModle!;
 //UserModle? get getUserInformation => _userModle ?? null;
    UserModle? get getUserInformation => _userModle;
  void addCartProduct(ProductModel productModel){
    _cartProductList.add(productModel);
    notifyListeners();

  }
   void removeProduct(ProductModel productModel){
    _cartProductList.remove(productModel);
    notifyListeners();

  }
  List<ProductModel> get getCartProductList =>_cartProductList;

  ////favourit
  
   final List<ProductModel> _favoruitProductList =[];

  void addfavoruitProduct(ProductModel productModel){
    _favoruitProductList.add(productModel);
    notifyListeners();

  }
   void removefavoruitProduct(ProductModel productModel){
    _favoruitProductList.remove(productModel);
    notifyListeners();

  }
  List<ProductModel> get getfavoruitProductList =>_favoruitProductList;

  
  void getUserInfoFirebase()async{
   _userModle = await FirebaseFirestoreHelper.instance.getUserInformation();
   notifyListeners();
  }



  void updateUserInfoFirebase(BuildContext context ,UserModle userModle,File? file)async{

    if (file == null){
      showLoaderDialog(context);
       _userModle = userModle;
    await  FirebaseFirestore.instance.collection("users").doc(_userModle!.id).set(_userModle!.toJson());
    Navigator.of(context,rootNavigator: true).pop();
     Navigator.of(context).pop();
   }else{
    showLoaderDialog(context);
    String imageUrl =
   await FirebaseStorageHelper.instance.uploadUserImage(file);
    _userModle = userModle.copyWith(image: imageUrl);
    await  FirebaseFirestore.instance.collection("users").doc(_userModle!.id).set(_userModle!.toJson());
    Navigator.of(context,rootNavigator: true).pop();
    Navigator.of(context).pop();
   }
   
   notifyListeners();
  }

  double toatalPrice(){
    double totalPrice=0.0;
    for(var element in _cartProductList){
      totalPrice += element.price*element.qty!;
    }
    return totalPrice;
  }

  double toatalPriceBuyProductList(){
    double totalPrice=0.0;
    for(var element in _buyProductList){
      totalPrice += element.price*element.qty!;
    }
    return totalPrice;
  }
  void updateQty(ProductModel productModel , int qty){
    int index = _cartProductList.indexOf(productModel);
    _cartProductList[index].qty=qty;
    notifyListeners();
  }
  void addBuyProduct(ProductModel model){
    _buyProductList.add(model);
    notifyListeners();
  }

  List<ProductModel> get getBuyProductList =>_buyProductList;
   
  void addBuyProductCartlist( ){
    _buyProductList.addAll(_cartProductList);
    notifyListeners();
  }

   void clearCart( ){
    _cartProductList.clear();
    notifyListeners();
  }

  void clearbuyProduct( ){
    _buyProductList.clear();
    notifyListeners();
  }
 

}