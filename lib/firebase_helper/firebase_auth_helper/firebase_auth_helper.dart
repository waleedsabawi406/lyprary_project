// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:library_project/constants/constants.dart';
import 'package:library_project/models/user_modle/user_modle.dart';

class FirebaseAuthHelper{
  static FirebaseAuthHelper instance =FirebaseAuthHelper();

final FirebaseAuth _auth =FirebaseAuth.instance;
final FirebaseFirestore _firestore =FirebaseFirestore.instance;
Stream<User?> get getAuthChange=> _auth.authStateChanges();


Future<bool> login(String email,String password,BuildContext context) async{
  try{
    showLoaderDialog(context);
   await  _auth.signInWithEmailAndPassword(email:email , password:password ,);
   Navigator.of(context).pop();
   return true;

  }on FirebaseAuthException catch(error){
    Navigator.of(context).pop();
    showMessag(error.code.toString());
    return false;
  }
}
Future<bool> SignUp(String name, String email,String password,BuildContext context) async{
  try{
    showLoaderDialog(context);
    UserCredential userCredential=
   await  _auth.createUserWithEmailAndPassword(email:email , password:password ,);
   UserModle userModle =UserModle(id: userCredential.user!.uid, name: name, email: email,image: null);
   _firestore.collection("users").doc(userModle.id).set(userModle.toJson());
   
   Navigator.of(context).pop();
   return true;

  }on FirebaseAuthException catch(error){
    Navigator.of(context).pop();
    showMessag(error.code.toString());
    return false;
  }
}

void signOut() async{
  await _auth.signOut();
}

Future<bool> ChangePassword(String password,BuildContext context) async{
  try{
    showLoaderDialog(context);
    _auth.currentUser!.updatePassword(password);
   Navigator.of(context,rootNavigator: true).pop();
   showMessag("Password Changed");
   Navigator.of(context).pop();
   return true;

  }on FirebaseAuthException catch(error){
    Navigator.of(context).pop();
    showMessag(error.code.toString());
    return false;
  }
}


}

