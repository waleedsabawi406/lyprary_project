import 'package:flutter/material.dart';
import 'package:library_project/screens/favouret_screen/widget/Single_item_favourit.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider= Provider.of<AppProvider>(context,);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Favourite Screen",style: TextStyle(color: Colors.black),),
      ),
      body:  appProvider.getfavoruitProductList.isEmpty?const Center(child: Text("Favourite is empty"),):ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: appProvider.getfavoruitProductList.length,
        itemBuilder: (ctx,index){
        return  SingelFavouriteItem(
          singleProduct: appProvider.getfavoruitProductList[index],
        );
      }),
    );
  }
}