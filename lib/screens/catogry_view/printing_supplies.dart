import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../models/product_modle/product_modle.dart';
import '../product_details/product_details.dart';

class PrintingSupplies extends StatefulWidget {
  const PrintingSupplies({super.key});

  @override
  State<PrintingSupplies> createState() => _PrintingSuppliesState();
}

class _PrintingSuppliesState extends State<PrintingSupplies> {
   bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:isLoading?Center(child:
      Container(
        height:100 ,
        width: 100,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),) 
      : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kToolbarHeight*1,),
            const Padding(
               padding: EdgeInsets.all(12.0),
               child: Row(
                children: [
                  BackButton(),
                  Text("Stationery",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                ],
               ),
             ),
            Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: printingProduct.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.85,
                        crossAxisCount: 2),
                      itemBuilder: (ctx,index){
                        ProductModel singleProduct = printingProduct[index];
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
          ],
        ),
      ),
    );
  }
}


 List<ProductModel> printingProduct=[
    ProductModel(
    image: "https://mylangroup.com/wp-content/uploads/2020/02/Piezo-1k-min.png",
    id: "37",
    name: "Ink",
    price: 30, 
    description: "Ink is a liquid or semi-liquid substance used for writing, printing, or drawing. It is typically composed of colorants, solvents, and binders. Ink is commonly used with pens, markers, and printers to produce written or printed text and images.",
    isFavourite: false
    ),

    ProductModel(
    image: "https://cdn-icons-png.flaticon.com/512/2541/2541988.png",
    id: "38",
    name: "Paper",
    price: 15, 
    description: "Paper is a versatile and widely used material made from pulp fibers, usually derived from wood, cotton, or other plant sources. It is produced through a process of pulping, drying, and pressing",
    isFavourite: false
    ),

    ProductModel(
    image: "https://pbs.twimg.com/media/E7TBgk5WUAAULs4.png",
    id: "39",
    name: "Print books",
    price: 10, 
    description: "Print books, also known as physical books or hard copy books, are tangible, bound publications that consist of printed pages held together by a cover. They have been the traditional and predominant form of books for centuries.",
    isFavourite: false
    ),

    ProductModel(
    image: "https://ssl-product-images.www8-hp.com/digmedialib/prodimg/lowres/c06628102.png",
    id: "40",
    name: "printer",
    price: 100, 
    description: "A printer is a peripheral device used to produce physical copies of digital documents or images. It takes electronic data from a computer or other devices and transfers it onto paper or other media.",
    isFavourite: false
    ),
];