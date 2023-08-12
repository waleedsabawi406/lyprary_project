import 'package:flutter/material.dart';
import 'package:library_project/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:library_project/models/order_modle/order_modle.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(centerTitle: true ,backgroundColor: Colors.white,title: const Text("your Orders",style: TextStyle(color: Colors.black),),),
          
          body:FutureBuilder(
            future: FirebaseFirestoreHelper.instance.getUserOrder(),
            builder: (context,snapshot){
              if( snapshot.connectionState==ConnectionState.waiting){
                return const Center(child:CircularProgressIndicator(),);
              }
              if( snapshot.data==null ||!snapshot.hasData){
                return const Center(child: Text("No Order Found"),);
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index){
              
                OrderModle orderModle=snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ExpansionTile(
                    childrenPadding: EdgeInsets.zero,
                    tilePadding: EdgeInsets.zero,
                    collapsedShape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.red,width: 2.3)
                    ),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Color.fromARGB(255, 44, 34, 33),width: 2.3)
                    ),
                    title:Row(
                          children: [
                Expanded(
                  child: Container(
                    height: 155,
                    width: 155,
                    color:  Colors.red.withOpacity(0.4),
                    child: Image.network(orderModle.products[0].image),
                    ),
                ),
              
                Expanded(
                  flex: 2,
                  child: SizedBox( 
                    height: 140,
                    child:   Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text(
                      orderModle.products[0].name,
                      style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 12,),
                       orderModle.products.length>1?SizedBox.fromSize()
                        : Column(
                          children: [
                            Text("Quantity : ${orderModle.products[0].qty.toString()}",
                       style: const TextStyle(
                       fontSize: 16.0,
                      
                                  ),),
                                  const SizedBox(height: 12,),
                          ],
                        ),
              
                        Text("TotalPrice : \$${orderModle.totalPrice.toString()}",
                       style: const TextStyle(
                       fontSize: 16.0,
                      
                              ),),
                       const SizedBox(height: 12,),
                         Text("OrderStatus :${orderModle.status} ",
                       style: const TextStyle(
                       fontSize: 16.0,
                       
                              ),),
                          
                        ],
                        
                      ),
                    ),
                     
                   ),
                ),
                           
                          ],
                        ),
                        children:orderModle.products.length>1?[
                          const Text("Details"),
                          const Divider(color: Colors.red,),
                          ...
                        orderModle.products.map((singleProduct){
                          return Padding(
                padding: const EdgeInsets.only(left: 12,top: 6,),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        color:  Colors.red.withOpacity(0.4),
                        child: Image.network(singleProduct.image),
                        ),
                          
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Text(
                        singleProduct.name,
                        style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Column(
                            children: [
                              Text("Quantity : ${singleProduct.qty.toString()}",
                         style: const TextStyle(
                         fontSize: 12.0,
                        
                                    ),),
                                    const SizedBox(height: 8,),
                            ],
                          ),
                          
                          Text("Price : \$${singleProduct.price.toString()}",
                         style: const TextStyle(
                         fontSize: 12.0,
                        
                                ),),
                            
                          ],
                          
                        ),
                      ),
                     
                    ],
                            ),
                            const Divider(color: Colors.red,)
                  ],
                ),
                          );
                        }).toList()
                        ]
                         :[],
                      
                    
                    ),
                );
              
              
                },),
              );
            }) ,
    );
  }
}