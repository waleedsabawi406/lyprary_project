import 'package:flutter/material.dart';
import 'package:library_project/models/catogary_mdel/catogary_mdel.dart';

import '../../constants/routes.dart';
import '../../firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import '../../models/product_modle/product_modle.dart';
import '../../widgets/top_titles/top_titles.dart';
import '../home/home.dart';
import '../product_details/product_details.dart';

class CatogryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CatogryView({super.key, required this.categoryModel});

  @override
  State<CatogryView> createState() => _CatogryViewState();
}

class _CatogryViewState extends State<CatogryView> {
  List<ProductModel> productModelList=[];

  bool isLoading=false;
  void getCategoryList()async{
    
    setState(() {
      isLoading=true;
    });
   productModelList= await FirebaseFirestoreHelper.instance.getCatogeryViewProduct(widget.categoryModel.id);
   setState(() {
      isLoading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: isLoading?Center(child:
      Container(
        height:100 ,
        width: 100,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),) 
      :SingleChildScrollView(
        child: Column(children: [
           Padding(
             padding: const EdgeInsets.all(12.0),
             child: TopTitles(title: widget.categoryModel.name, subtitile: ""),
           ),
          Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: bestProduct.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.85,
                    crossAxisCount: 2),
                  itemBuilder: (ctx,index){
                    ProductModel singleProduct = bestProduct[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      
                      child: Column(children: [
              
                        const SizedBox(
                           height: 12.0,
                          ),
                        Image.network(singleProduct.image,height: 60,width: 60,),
                        const SizedBox(
                           height: 12.0,
                          ),
                          Text(
                            singleProduct.name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(
                           height: 5.0,
                          ),
                    
                          Text("Price: \$${singleProduct.price}"),
                    
                          const SizedBox(
                           height: 12.0,
                          ),
                    
                          SizedBox(
                            height: 45,width: 140,
                            child: OutlinedButton(onPressed: (){
                              Routes.instance.push(widget: ProductDetails(singleProduct: singleProduct), context: context);
                            },
                            
                             child: const Text("Buy",),),),
                      
                      ]),
                    );
                  },
                  ),
              ),
        ],),
      ),

    );
  }
}