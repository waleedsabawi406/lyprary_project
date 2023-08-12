

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../models/product_modle/product_modle.dart';
import '../../../provider/app_provider.dart';

class SingelCartItem extends StatefulWidget {
 final ProductModel singleProduct;
  const SingelCartItem({super.key,required this.singleProduct});

  @override
  State<SingelCartItem> createState() => _SingelCartItemState();
}

class _SingelCartItemState extends State<SingelCartItem> {
  
   int qty=1;

   @override
  void initState() {
    qty=widget.singleProduct.qty??1;
    setState(() { });
    super.initState();
  }
   
  
  
  @override
 
  Widget build(BuildContext context) {
    AppProvider appProvider= Provider.of<AppProvider>(context,);
    return Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.red,width: 3,),

          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 140,
                  color:  Colors.red.withOpacity(0.4),
                  child: Image.network(widget.singleProduct.image),
                  ),
              ),

              Expanded(
                flex: 2,
                child: SizedBox( 
                  height: 140,
                  child:   Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                          crossAxisAlignment:CrossAxisAlignment.start,
                          
                          children: [
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Text(
                            widget.singleProduct.name,
                            style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                                ),
                              ),

                                 
                            Row(
                             children: [
                             CupertinoButton(
                              onPressed: () {  
                              
                                  if(qty >1 ){
                                    setState(() {
                                      qty--;
                                    });
                                     appProvider.updateQty(
                                  widget.singleProduct,qty
                                );
                                  }
                              
                              },
                              padding: EdgeInsets.zero,
                              child: const CircleAvatar(
                                maxRadius: 13,
                                child: Icon(Icons.remove),
                              ),
                            ),
                          
                            Text( qty.toString(),
                            style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold
                              ),),
                          
                        CupertinoButton(
                              onPressed: () { 
                               
                                setState(() {
                                qty++; 
                                });
                                 appProvider.updateQty(
                                  widget.singleProduct,qty
                                );
                          
                         },
                        padding: EdgeInsets.zero,
                        child: const CircleAvatar(
                          maxRadius: 13,
                          child: Icon(Icons.add),
                        ),
                  ),

                  
                ],
              ),
                           CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              if(!appProvider.getfavoruitProductList.contains(widget.singleProduct)){
                        appProvider.addfavoruitProduct(widget.singleProduct);
                        showMessag("Added to wishlist");
                      }else{
                        appProvider.removefavoruitProduct(widget.singleProduct);
                        showMessag("Removed to wishlist");
                      }
                      
                              
                            },
                             child:  Text(appProvider.getfavoruitProductList.contains(widget.singleProduct)
                             ?"Remove to wishlist":"Add to wishlist",
                              style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold
                                      ),),
                           ),      
                              ],
                              
                            ),
                              
                          Text(widget.singleProduct.price.toString(),
                         style: const TextStyle(
                         fontSize: 18.0,
                         fontWeight: FontWeight.bold
                                    ),),
                             
                          ],
                        ),
                        CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              
                    appProvider.removeProduct(widget.singleProduct);
                    showMessag("Remove to Cart");
                            },
                             child: const CircleAvatar(
                               maxRadius: 13,
                              child: Icon(Icons.delete,size: 17,)),
                           ),


                      ],
                    ),
                  ),
                   
                 ),
              ),
             
            ],
          ),
        );
  }
}