// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/product_modle/product_modle.dart';
import '../../../provider/app_provider.dart';

class SingelFavouriteItem extends StatefulWidget {
 final ProductModel singleProduct;
  const SingelFavouriteItem({super.key,required this.singleProduct});

  @override
  State<SingelFavouriteItem> createState() => _SingelFavouriteItemState();
}

class _SingelFavouriteItemState extends State<SingelFavouriteItem> {
  
   
  
  
  @override
 
  Widget build(BuildContext context) {
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

                                 
                          
                           CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                             AppProvider appProvider= Provider.of<AppProvider>(context,listen: false);
                             appProvider.removefavoruitProduct(widget.singleProduct);
                           

                            },
                             child: const Text("Remove to whisht",
                              style: TextStyle(
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