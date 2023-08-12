
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_project/constants/constants.dart';
import 'package:library_project/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:library_project/widgets/primary_button/primary_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isShowPassword=true;
  TextEditingController newpassword=TextEditingController();
  TextEditingController confirmpassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
      title: const Text("Change Password",style: TextStyle(color: Colors.black),),),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
            TextFormField(
             controller: newpassword,
              obscureText: isShowPassword,
              decoration:  InputDecoration(
                hintText: "New password",
                prefixIcon: const Icon(Icons.password_sharp,color: Colors.grey,),
                suffixIcon: CupertinoButton(child: const Icon(Icons.visibility ,color: Colors.grey,), onPressed: (){
                  setState(() {
                    isShowPassword=!isShowPassword;
                    
                    
                  });
                })
                
              ),
            ),
              const SizedBox(height: 24.0,),
              TextFormField(
             controller: confirmpassword,
              obscureText: isShowPassword,
              decoration:  const InputDecoration(
                hintText: "confirm password",
                prefixIcon: Icon(Icons.password_sharp,color: Colors.grey,),
                
                
              ),
            ),
const SizedBox(height: 36.0,),

             PrimaryButton(title: "Update",
          onPressed: ()async {
            if(newpassword.text.isEmpty){showMessag("new Password is empty");}
            else if (confirmpassword.text.isEmpty){showMessag("confirm Password is empty");}
           else  if (confirmpassword.text ==newpassword.text){
              FirebaseAuthHelper.instance.ChangePassword(newpassword.text, context);
              
            }
            else{
            showMessag("confirm Password is not match");
            }
            
            
            
          },)
        ],
      ),
    );
  }
}