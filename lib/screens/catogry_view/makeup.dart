import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../models/product_modle/product_modle.dart';
import '../product_details/product_details.dart';

class Makeup extends StatefulWidget {
  const Makeup({super.key});

  @override
  State<Makeup> createState() => _MakeupState();
}

class _MakeupState extends State<Makeup> {
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
                      itemCount: makeupProduct.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.85,
                        crossAxisCount: 2),
                      itemBuilder: (ctx,index){
                        ProductModel singleProduct = makeupProduct[index];
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



 List<ProductModel> makeupProduct=[
    

    ProductModel(
    image: "https://ae01.alicdn.com/kf/U6c6c2116e7084c8d910d5a2db8ac2917n.png_640x640.png_.webp",
    id: "27",
    name: "iliner",
    price: 10, 
    description: "I apologize, but I'm not familiar with the term iliner. It seems to be a less common or specialized term. Could you please provide more context or clarify what you mean by ",
    isFavourite: false
    ),
    ProductModel(
    image: "https://cdn.shopify.com/s/files/1/0014/3514/0183/products/LakmeAbsoluteFlutterSecretsDramaticEyesMascara_640x.png?v=1652946523",
    id: "28",
    name: "mascara",
    price: 15, 
    description: "A mascara is a cosmetic product used to enhance and define the eyelashes. It typically comes in a tube with a wand applicator attached to the cap. The wand is coated with a thick, liquid or creamy formula containing pigments and polymers",
    isFavourite: false
    ),
    ProductModel(
    image: "https://cdn.accentuate.io/39361687355473/11220358594641/PatrickTa_KelseyFugere2-v1622545900384.png?1000x1000",
    id: "29",
    name: "Eyeshadow",
    price: 25, 
    description: "Eyeshadow is a cosmetic product used to add color and depth to the eyelids. It is available in various forms, including powder, cream, and liquid. Eyeshadows come in a wide range of colors, finishes, and textures, allowing individuals to create a variety of looks and effects.",
    isFavourite: false
    ),
    ProductModel(
    image: "https://media.ulta.com/i/ulta/2597537?w=1020&h=1020",
    id: "30",
    name: "highlighter",
    price: 15, 
    description: " A highlighter, in the context of cosmetics, refers to a makeup product used to add a luminous glow or highlight to specific areas of the face. It is typically applied to areas that naturally catch light, such as the cheekbones, brow bones, bridge of the nose, and cupid's bow.",
    isFavourite: false
    ),
    ProductModel(
    image: "https://sdcdn.io/mac/us/mac_sku_M2LP3R_1x1_0.png?width=1440&height=1440",
    id: "31",
    name: "Lipstick",
    price: 15, 
    description: " Lipstick is a cosmetic product used to add color, definition, and sometimes hydration to the lips. It is one of the most popular and widely used makeup items. Lipsticks come in a vast array of shades, finishes, and formulations to suit various preferences and occasions.",
    isFavourite: false
    ),
    ProductModel(
    image: "https://sdcdn.io/mac/au/mac_sku_M6JC07_1x1_0.png?width=1440&height=1440",
    id: "32",
    name: "foundation",
    price: 30, 
    description: "Foundation is a cosmetic product used to even out the skin tone, create a smooth complexion, and provide a base for other makeup products. It is typically applied to the face and neck to create a uniform color and texture, covering imperfections and creating a more flawless appearance",
    isFavourite: false
    ),
    ProductModel(
    image: "https://media.ulta.com/i/ulta/2532917?w=500&h=500",
    id: "33",
    name: "Concealer",
    price: 18, 
    description: " Concealer is a cosmetic product used to camouflage or hide imperfections on the skin, such as dark circles, blemishes, redness, or discoloration. It is typically applied to specific areas of the face where additional coverage is needed, either before or after foundation application.",
    isFavourite: false
    ),
    ProductModel(
    image: "https://sdcdn.io/mac/us/mac_sku_S6AT01_1x1_1.png?width=1080&height=1080",
    id: "34",
    name: "Contour",
    price: 20, 
    description: "Contouring is a makeup technique used to enhance and define the natural contours of the face, creating the illusion of dimension and structure. It involves using makeup products, typically a matte bronzer or contour powder, to shade and sculpt specific areas of the face.",
    isFavourite: false
    ),
    ProductModel(
    image: "https://sdcdn.io/mac/au/mac_sku_M53002_1x1_0.png?width=1080&height=1080",
    id: "35",
    name: "Powder",
    price: 30, 
    description: " Powder contour refers to using powdered makeup products to contour and define the facial features. It typically involves using a matte bronzer or contour powder in a shade slightly darker than the natural skin tone to create shadows and add depth",
    isFavourite: false
    ),
    ProductModel(
    image: "https://cdn.shopify.com/s/files/1/0518/3835/3573/products/c0581a34f134877e437147a5e938a9679cf5ed9aa96fc9dcf8ccdffa52b59e36_2048x.png?v=1670811824",
    id: "36",
    name: "Kohl",
    price: 8, 
    description: "Kohl, also known as kajal, is a traditional eye makeup product that has been used for centuries in many cultures. It is typically in the form of a soft, dark pencil or powder that is applied along the waterline of the eyes or smudged along the lash line to create a dramatic and intense look.",
    isFavourite: false
    ),
];