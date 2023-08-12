



// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:library_project/constants/constants.dart';
import 'package:library_project/models/catogary_mdel/catogary_mdel.dart';
import 'package:library_project/models/order_modle/order_modle.dart';

import '../../models/product_modle/product_modle.dart';
import '../../models/user_modle/user_modle.dart';

class FirebaseFirestoreHelper{
  static FirebaseFirestoreHelper instance =FirebaseFirestoreHelper();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<CategoryModel>> getCategories()async{

    try{
      QuerySnapshot<Map<String,dynamic>>querySnapshot=
      await _firebaseFirestore.collection("categories").get();
      List<CategoryModel>categorisList=querySnapshot.docs
      .map((e) => CategoryModel.fromJson(e.data()))
      .toList();
      return categorisList;

    }catch(e){
      showMessag(e.toString());
      return[];
    }
  }

  Future<List<ProductModel>> getBestProduct()async{

    try{
      QuerySnapshot<Map<String,dynamic>>querySnapshot=
      await _firebaseFirestore.collectionGroup("Products").get();
      List<ProductModel>productModelList = querySnapshot.docs
      .map((e) => ProductModel.fromJson(e.data()))
      .toList();
      return productModelList;

    }catch(e){
      showMessag(e.toString());
      return[];
    }
  }

  Future<List<ProductModel>> getCatogeryViewProduct(String id)async{

    try{
      QuerySnapshot<Map<String,dynamic>>querySnapshot=
      await _firebaseFirestore.collection("categories").doc(id).collection("Products").get();
      List<ProductModel>productModelList = querySnapshot.docs
      .map((e) => ProductModel.fromJson(e.data()))
      .toList();
      return productModelList;

    }catch(e){
      showMessag(e.toString());
      return[];
    }
  }



  Future<UserModle> getUserInformation()async{

    DocumentSnapshot<Map<String,dynamic>>querySnapshot=
       await _firebaseFirestore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
      
      return UserModle.fromJson(querySnapshot.data()!);
  }

  Future<bool>uploadOrderedProductFirebase(List<ProductModel> list,BuildContext context,String payment)async{
   try {
    showLoaderDialog(context);
    double toatalPrice=0.0;
    for(var element in list){
      toatalPrice +=element.price*element.qty!;
    }
    DocumentReference documentReference=
    _firebaseFirestore.collection("usersOrders").doc(FirebaseAuth.instance.currentUser!.uid).collection("orders").doc();
  DocumentReference admin=  _firebaseFirestore.collection('orders').doc();
    admin.set({
      "products":list.map((e) => e.toJson()),
      "status":"Pending",
      "totalPrice":toatalPrice,
      "payment":payment,
      "orderId":admin.id,

    });
    documentReference.set({
      "products":list.map((e) => e.toJson()),
      "status":"Pending",
      "totalPrice":toatalPrice,
      "payment":payment,
      "orderId":documentReference.id,
    });
    Navigator.of(context,rootNavigator: true).pop();
    showMessag("Ordered Successfully");
    return true; 
   } catch (e) {
    showMessag(e.toString());
    Navigator.of(context,rootNavigator: true).pop();
        return false; 
 
   }
  }


  Future<List<OrderModle>>getUserOrder()async{
    try {
      
      QuerySnapshot<Map<String,dynamic>>querySnapshot=
   await _firebaseFirestore.collection('usersOrders').doc(FirebaseAuth.instance.currentUser!.uid).collection('orders').get();
   
    List<OrderModle>orderList=
   querySnapshot.docs.map((element) => OrderModle.fromJson(element.data())).toList();
       

   return orderList;
    } catch (e) {
      showMessag(e.toString());
        

      return[];
    }
  }
  void updateTpkenFromFirebase()async{
    String? token = await FirebaseMessaging.instance.getAPNSToken();

    if(token!=null){
     await _firebaseFirestore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
       "notificationToken":token,
      });
    }
  }


  



}