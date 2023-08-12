// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_project/constants/constants.dart';
import 'package:library_project/constants/routes.dart';
import 'package:library_project/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:library_project/screens/auth_ui/sign_up/sign_up.dart';
import 'package:library_project/widgets/primary_button/primary_button.dart';
import 'package:library_project/widgets/top_titles/top_titles.dart';

import '../../coustom_bottom_bar/coustom_bottom_bar.dart';

class Login extends StatefulWidget {
  
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  bool isShowPassword=true;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const TopTitles(title: "Login", subtitile: "welcome Back To Al Waleed Store"),
      
            const SizedBox(
              height: 46.0,
            ),
      
      
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
             PrimaryButton(title: "Login",
            onPressed: () async {
             bool isVaildated= loginVaildation(email.text,password.text);
             if(isVaildated){
              bool isLogined=await FirebaseAuthHelper.instance.login(email.text, password.text,context);
              if (isLogined){
                Routes.instance.pushAndRemoveUntil(widget: const CustomBottomBar(), context: context);
              }
              
             }
            },
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Center(child: Text("Don't have an account?")),
            const SizedBox(
              height: 12.0,
            ),
            Center(child: CupertinoButton(onPressed: (){
              Routes.instance.push(widget:const SignUp(),context:context);
            },
             child: 
             Text("Create an account",style: TextStyle(color: Theme.of(context).primaryColor,),),),),
      
          ]),
        ),
      ),
    );
  }
}