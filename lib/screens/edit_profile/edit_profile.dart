import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:library_project/provider/app_provider.dart';
import 'package:library_project/widgets/primary_button/primary_button.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../models/user_modle/user_modle.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File?image;
  void takePicture() async {
    XFile? value = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 40);
    if (value != null){
      setState(() {
        image =File(value.path);
      });
    }
  }
  TextEditingController textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,title: const Text("Profile",style: TextStyle(color: Colors.black),),),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        children:  [
          image==null?
          CupertinoButton(
            onPressed: () {
             takePicture(); 
            },
            child:  const CircleAvatar(
              radius: 70,
              child: Icon(Icons.camera_alt)
            ),
          ):CupertinoButton(
            onPressed: () {
             takePicture(); 
            },
            child:   CircleAvatar(
              radius: 70,
             backgroundImage: FileImage(image!),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: appProvider.getUserInformation?.name??"wasa",
            ),
          ),
          
          const SizedBox(
            
            height: 12.0,
          ),
          PrimaryButton(title: "Update",
          onPressed: ()async {
            UserModle? userModle=appProvider.getUserInformation?.copyWith(name: textEditingController.text);
            appProvider.updateUserInfoFirebase(context,  userModle!, image);
            showMessag("Succesfully updated profile");
            
            
          },)
        ],
       ),
    );
  }
}