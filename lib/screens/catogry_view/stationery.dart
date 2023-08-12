import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../models/product_modle/product_modle.dart';

import '../product_details/product_details.dart';

class Stationery extends StatefulWidget {
  
  const Stationery({super.key});

  @override
  State<Stationery> createState() => _StationeryState();
}

class _StationeryState extends State<Stationery> {
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      itemCount: stationeryProduct.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.85,
                        crossAxisCount: 2),
                      itemBuilder: (ctx,index){
                        ProductModel singleProduct = stationeryProduct[index];
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




List<ProductModel> stationeryProduct=[
    ProductModel(
    image: "https://www.goodfreephotos.com/albums/vector-images/big-pencil-vector-art.png",
    id: "1",
    name: "pencil",
    price: 1, 
    description: " pencil artistic sketching and drawing, for stenography or notes. Its benefits are the simple usage as well as being able to remove what you've drawn with an eraser",
    isFavourite: false),

    ProductModel(
    image: "https://freesvg.org/img/StackOfBooks.png",
    id: "2",
    name: "book",
    price: 5, 
    description: " book description is a short summary of a book's story or content that is designed to “book” a reader and lead to a sale",
    isFavourite: false),

    ProductModel(
    image: "https://png.pngtree.com/png-vector/20220706/ourmid/pngtree-pencil-sharpener-clipart-design-in-blue-yellow-color-png-image_5720185.png",
    id: "3",
    name: "pencil_sharper",
    price: 1, 
    description: " pencil_sharper artistic sketching and drawing, for stenography or notes. Its benefits are the simple usage as well as being able to remove what you've drawn with an eraser",
    isFavourite: false),

    ProductModel(
    image: "https://cdn.pixabay.com/photo/2014/04/02/16/30/eraser-307519_640.png",
    id: "4",
    name: "eraser",
    price: 1, 
    description: " eraser is a short summary of a book's story or content that is designed to “hook” a reader and lead to a sale",
    isFavourite: false
    ),
 ProductModel(
    image: "https://imgproxy-retcat.assets.schwarz/LZSTPrW5GK68MYOyAiSHkk34K9xJa0OLgvLVJ7MvEPE/sm:1/w:1500/h:1125/cz/M6Ly9wcm9kLWNhd/GFsb2ctbWVkaWEvaWUvMS8yRTNBQjM1MkJEQUMyRUNBRDk2RDI1OUM/1RUFGRDdDQzUzNjc4QkI0OTAwQURGMzdFRTAxMzY4NDQxOUI0Q0Y1LnBuZw.png",
    id: "5",
    name: "Colors",
    price: 2, 
    description: "When it comes to drawing, there is a wide range of colors available to artists. These colors can be categorized into different types, including primary, secondary, and tertiary colors, as well as warm and cool colors. Here is a brief description of these color categories",
    isFavourite: false),

    ProductModel(
    image: "https://lp-littleprince.com/assets/uploads/category/122410.png",
    id: "6",
    name: "pencil",
    price: 2, 
    description: "pencil artistic sketching and drawing, for stenography or notes. Its benefits are the simple usage as well as being able to remove what you've drawn with an eraser",
    isFavourite: false),

    ProductModel(
    image: "https://delivery.ocp.richemont.com/api/public/content/default__Vxf51QkirFEBZQrydQkLWofdX1TEmNBm?impolicy=resize&width=750",
    id: "7",
    name: "pen",
    price: 1, 
    description: " A pen is a simple and common writing instrument that consists of a thin cylindrical tube with an ink-filled reservoir inside. It typically has a small ball at the tip called a ",
    isFavourite: false),

    ProductModel(
    image: "https://www.promateworld.com/storage/product-images/bpfg0452-rathna-stapler-machine-hd-45.png",
    id: "8",
    name: "stapler",
    price: 5, 
    description: " A stapler is a small, handheld device used to fasten sheets of paper together. It is a common tool found in offices, schools, and households. A typical stapler consists of a metal or plastic body with a spring-loaded mechanism. The front end of the stapler features a metal plate with two prongs, known as the staple driver. These prongs bend inward to hold the staple in place.",
    isFavourite: false
    ),

    ProductModel(
    image: "https://d11r0n2xhffvf0.cloudfront.net/maayergy/product/7cf9dda3bf82c93d460ac3c3ec1956a9.png",
    id: "9",
    name: "pins",
    price: 1, 
    description: " A pens is a simple and common writing instrument that consists of a thin cylindrical tube with an ink-filled reservoir inside. It typically has a small ball at the tip called a ",
    isFavourite: false),

    ProductModel(
    image: "https://media.zid.store/cdn-cgi/image/w=300,h=300,q=100,f=auto/https://media.zid.store/thumbs/2b414e16-1a8b-4bd1-86eb-76320c8564fc/bfab7a3c-c140-49bc-9110-aba6a82744f0-thumbnail-500x500.png",
    id: "10",
    name: "Punch",
    price: 5, 
    description: "Punch simple and common writing instrument that consists of a thin cylindrical tube with anhandheld device used to fasten sheets of paper together",
    isFavourite: false
    ),
    


    
];