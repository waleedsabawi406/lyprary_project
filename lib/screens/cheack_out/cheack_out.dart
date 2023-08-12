
import 'package:flutter/material.dart';
import 'package:library_project/constants/routes.dart';
import 'package:library_project/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:library_project/models/product_modle/product_modle.dart';
import 'package:library_project/provider/app_provider.dart';
import 'package:library_project/screens/coustom_bottom_bar/coustom_bottom_bar.dart';
import 'package:library_project/widgets/primary_button/primary_button.dart';
import 'package:provider/provider.dart';

import '../stripe_helper/stripe_helper.dart';

class CheakOut extends StatefulWidget {
  final ProductModel singleProduct;
  const CheakOut({super.key, required this.singleProduct});

  @override
  State<CheakOut> createState() => _CheakOutState();
}

class _CheakOutState extends State<CheakOut> {
  int groupValue =1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider= Provider.of<AppProvider>(context,);
    return  Scaffold(
    appBar: AppBar(centerTitle: true ,backgroundColor: Colors.white,title: const Text("Check Out",style: TextStyle(color: Colors.black),),),
    
    body:  Column(
      children: [
       const SizedBox(
          height: 36,
        ),
        Container(
         margin: const EdgeInsets.all(12.0),
         height: 80,
         width: double.infinity,
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Theme.of(context).primaryColor,width: 3.0
          )
         ),
         child: Row(
          children: [
            
            Radio( value: 1,groupValue: groupValue,onChanged: (value){
              setState(() {
                groupValue=value!;
              });

            },),
            const Icon(Icons.money),
            const SizedBox(width: 12.0,),
            const Text("Cash on Delivery",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
          ],
         ),
        ),


         Container(
         margin: const EdgeInsets.all(12.0),
         height: 80,
         width: double.infinity,
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Theme.of(context).primaryColor,width: 3.0
          )
         ),
         child: Row(
          children: [
            
            Radio( value: 2,groupValue: groupValue,onChanged: (value){
              setState(() {
                groupValue=value!;
              });

            },),
            const Icon(Icons.money),
            const SizedBox(width: 12.0,),
            const Text("Pay online",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
          ],
         ),
        ),
        const SizedBox(width: 12.0,),

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: PrimaryButton(
            
            title: "Continues",onPressed: ()async {
            appProvider.clearbuyProduct();
            

            appProvider.addBuyProduct(widget.singleProduct);
            if(groupValue==1){
                 bool value=await FirebaseFirestoreHelper.instance.uploadOrderedProductFirebase(appProvider.getBuyProductList, context,"Cash on delivery");
            appProvider.clearbuyProduct();
            if(value){
              Future.delayed(const Duration(seconds: 2),(){
                Routes.instance.push(widget: const CustomBottomBar(), context: context);
              });
             }
              }else{
                int value = double.parse(appProvider.toatalPriceBuyProductList().toString()).round().toInt();
                String toatalPrice = (value*100).toString();
            
             await StripeHelper.instance.makePayment(toatalPrice.toString(),context);

           
                
              }
          },),
        )
        
        
      ],
    ),

    );
  }
}




