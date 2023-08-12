
import 'package:flutter/material.dart';
import 'package:library_project/constants/constants.dart';
import 'package:library_project/constants/routes.dart';
import 'package:library_project/screens/cart_item_cheakout/cart_item_cheakout.dart';

import 'package:library_project/screens/cart_screen/widgets/singel_cart_item.dart';

import 'package:library_project/widgets/primary_button/primary_button.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
     AppProvider appProvider= Provider.of<AppProvider>(context,);
    return Scaffold(
      bottomNavigationBar:  SizedBox(
      height: 180,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                          const Text("Total",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                           Text("\$${appProvider.toatalPrice().toString()}",style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
      
            ],),
             const SizedBox(height: 24,),
             PrimaryButton(title: "cheack Out",onPressed: () {
                appProvider.clearbuyProduct();
            appProvider.addBuyProductCartlist();
            appProvider.clearCart();
            if(appProvider.getBuyProductList.isEmpty){
           showMessag("Cart is Empty");

            }else{
          Routes.instance.push(widget: const CartItemCheakOut(), context: context);

            }
              
             },),
          ],
        ),
       
      ),
    ),
      appBar: AppBar(
        title:  const Text("Cart Screen",style: TextStyle(color: Colors.black),),
      ),
      body:  appProvider.getCartProductList.isEmpty?const Center(child: Text("Cart is empty"),):ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: appProvider.getCartProductList.length,
        itemBuilder: (ctx,index){
        return  SingelCartItem(
          singleProduct: appProvider.getCartProductList[index],
        );
      }),
    );
  }
}