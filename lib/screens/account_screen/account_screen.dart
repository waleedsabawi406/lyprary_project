
// ignore_for_file: avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_project/constants/routes.dart';
import 'package:library_project/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:library_project/screens/about_us/about_us.dart';
import 'package:library_project/screens/favouret_screen/favourit_screen.dart';
import 'package:library_project/screens/order_screen/order_screen.dart';
// import 'package:library_project/widgets/primary_button/primary_button.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';
import '../change_password/change_password.dart';
// import '../edit_profile/edit_profile.dart';

class AccontScreen extends StatefulWidget {
  const AccontScreen({super.key});

  @override
  State<AccontScreen> createState() => _AccontScreenState();
}

class _AccontScreenState extends State<AccontScreen> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
        AppProvider appProvider =Provider.of<AppProvider>(context);

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Profile",style: TextStyle(color: Colors.black),),),
        body: Column(
          children: [
              Expanded(child: Column(
              children: [
                
                  appProvider.getUserInformation?.image==null?
               const Icon(Icons.person_outline,size: 150,)
                 :const CircleAvatar(
                  //  backgroundImage: NetworkImage(appProvider.getUserInformation.image!),
                  radius: 70,
                 ),
                 Text(currentUser.email!,
               style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
               
                 
                // Text(appProvider.getUserInformation?.name??"wasa",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                // Text(appProvider.getUserInformation?.email ?? 'wasa.com',),

                
              //  const SizedBox(height: 12.0,),
              //  SizedBox(width: 130,child: PrimaryButton(title: "Edit Profile",onPressed: () {
              //   Routes.instance.push(widget: const EditProfile(), context: context);
              //  })),
              ],
            )),
             Expanded(flex: 2,
             child: Container(
              child:  Column(
                children: [
                  ListTile(
                    onTap: () {  
                       Routes.instance.push(widget: const OrderScreen(), context: context);
                    },
                    leading: const Icon(Icons.shopping_bag_outlined),
                    title: const Text("Your Orders"),
                  ),

                 

                  ListTile(
                    onTap: () { 
                      Routes.instance.push(widget: const FavouriteScreen(), context: context);
                     },
                    leading: const Icon(Icons.favorite_outline),
                    title: const Text("Favourite"),
                  ),

                   ListTile(
                    onTap: () { 
                      Routes.instance.push(widget: const AboutAs(), context: context);
                     },
                    leading: const Icon(Icons.info_outline),
                    title: const Text("About us"),
                  ),

                 

                   ListTile(
                    onTap: () { 
                      Routes.instance.push(widget: const ChangePassword(), context: context);
                     },
                    leading: const Icon(Icons.change_circle_outlined),
                    title: const Text("change password"),
                  ),

                  ListTile(
                    onTap: () { 
                      FirebaseAuthHelper.instance.signOut(); 
                      setState(() {
                        
                      });                    },
                    leading: const Icon(Icons.exit_to_app_outlined),
                    title: const Text("log out"),
                  ),
                  const SizedBox(height: 12,),
                  

                
                ],
              ),
             ),)
          ],
        ),
    );
  }
}