import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_project/constants/asset_images.dart';
import 'package:library_project/constants/routes.dart';
import 'package:library_project/screens/auth_ui/login/login.dart';
import 'package:library_project/screens/auth_ui/sign_up/sign_up.dart';
import 'package:library_project/widgets/primary_button/primary_button.dart';
import 'package:library_project/widgets/top_titles/top_titles.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(title: "Welcome", subtitile: "by any item from using app"),
        
              Center(child: Image.asset(AssetImages.instance.welcomeImage)),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    onPressed: () {  },
                    child: const Icon(
                      Icons.facebook,
                    size: 50.0,
                    color: Colors.blue,
                    ),
                  ),
      
                  const SizedBox(width: 12.0,),
      
                  CupertinoButton(
                    onPressed: () {  },
                    child: SizedBox(
                      width:58,
                      height:58,
                      child: Image.network(
                          'https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1',
                          fit:BoxFit.cover
                      ),
                            ),
                  )
                  
      
      
                ],
              ),
              const SizedBox(
                height: 18,
                
              ),
              PrimaryButton(title: "Login",onPressed:(){
                Routes.instance.push(widget: const Login(),context: context);
              } ,),
              const SizedBox(
                height: 18,
                
              ),
      
              PrimaryButton(title: "SignUp",onPressed:(){
                Routes.instance.push(widget:const SignUp(),context:context);
              } ,),
      
            
            ]),
        ),
      ),
    );
  }
}