

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

UserModle userModleFromJson(String str)=>
UserModle.fromJson(json.decode(str));

String UserModleToJson(UserModle data)=> json.encode(data.toJson());

class UserModle{
  String? image;
  String id;
  String name;
  String email;
 

  UserModle({
    this.image,
   required this.id,
   required this.name,
   required this.email
   
   
  });
  factory UserModle.fromJson(Map<String,dynamic>json)=>UserModle(
   
    image: json["image"], id: json["id"], name: json["name"],email: json["email"],
    
  );

  Map<String,dynamic>toJson()=>{
    
    "image":image,
    "id":id,
    "name":name,
    "email":email,
  };
  UserModle copyWith({
    String?name,image
  })=>
  UserModle(
   image: image?? this.image,
   name: name?? this.name, 
   id: id,
   email: email,
   );



}