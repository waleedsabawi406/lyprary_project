// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_project/constants/constants.dart';
import 'package:library_project/constants/routes.dart';
import 'package:library_project/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:library_project/screens/coustom_bottom_bar/coustom_bottom_bar.dart';
import 'package:library_project/widgets/primary_button/primary_button.dart';
import 'package:library_project/widgets/top_titles/top_titles.dart';

class SignUp extends StatefulWidget {
  
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email=TextEditingController();
  
  TextEditingController phone=TextEditingController();
  TextEditingController name=TextEditingController();
  bool isShowPassword=true;
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const TopTitles(title: "Create Account", subtitile: "welcome Back To Al Waleed Store"),
      
            const SizedBox(
              height: 46.0,
            ),
      
      
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                hintText: "Name",
                prefixIcon: Icon(Icons.person_outline,color: Colors.grey,),
                
              ),
            ),
            const SizedBox(height: 12.0,),
            TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "E_mail",
                prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,),
                
              ),
            ),
            const SizedBox(height: 12.0,),
            TextFormField(
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "Phone",
                prefixIcon: Icon(Icons.phone_outlined,color: Colors.grey,),
                
              ),
            ),
      
            const SizedBox(height: 12.0,),
            TextFormField(
             controller: password,
              obscureText: isShowPassword,
              decoration:  InputDecoration(
                hintText: "password",
                prefixIcon: const Icon(Icons.password_sharp,color: Colors.grey,),
                suffixIcon: CupertinoButton(child: const Icon(Icons.visibility ,color: Colors.grey,), onPressed: (){
                  setState(() {
                    isShowPassword=!isShowPassword;
                    
                    
                  });
                })
                
              ),
            ),
      
            const SizedBox(height: 36.0,),
             PrimaryButton(title: "Create an account",
            onPressed: () async{
              bool isVaildated= signUpVaildation(email.text,password.text,name.text,phone.text);
             if(isVaildated){
              bool isLogined=await FirebaseAuthHelper.instance.SignUp(name.text,email.text, password.text,context);
              if (isLogined){
                Routes.instance.pushAndRemoveUntil(widget: const CustomBottomBar(), context: context);
              }
              
             }
            },
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Center(child: Text("I have already an account?")),
            const SizedBox(
              height: 12.0,
            ),
            Center(child: CupertinoButton(onPressed: (){Navigator.of(context).pop;}, child: 
             Text("Login",style: TextStyle(color: Theme.of(context).primaryColor,),),),),
      
          ]),
        ),
      ),
    );
  }
}