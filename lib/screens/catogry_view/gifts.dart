import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../models/product_modle/product_modle.dart';
import '../product_details/product_details.dart';

class Gifts extends StatefulWidget {
  const Gifts({super.key});

  @override
  State<Gifts> createState() => _GiftsState();
}

class _GiftsState extends State<Gifts> {
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
                      itemCount: giftsProduct.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.85,
                        crossAxisCount: 2),
                      itemBuilder: (ctx,index){
                        ProductModel singleProduct = giftsProduct[index];
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


List<ProductModel> giftsProduct=[


    ProductModel(
    image: "https://cdn.shopify.com/s/files/1/0693/3849/7331/products/white-ceramic-mug-with-color-inside-red-11oz-right-63cee6b23f65e_1024x1024.png?v=1674584920",
    id: "19",
    name: "cup",
    price: 7, 
    description: " A gift cup, also known as a coffee mug or a tea cup, is a popular item given as a present for various occasions.",
    isFavourite: false,
    ),
    ProductModel(
    image: "https://static.wikia.nocookie.net/disneyarabic/images/4/42/Pooh_Sitting.png/revision/latest/scale-to-width-down/1200?cb=20180621233536&path-prefix=ar",
    id: "20",
    name: "teddy",
    price: 12, 
    description: " A teddy, short for teddy bear, is a stuffed toy in the shape of a bear. It is typically made of soft, plush fabric and filled with stuffing material, such as cotton or synthetic fibers",
    isFavourite: false
    ),
    ProductModel(
    image: "https://cdn.salla.sa/GBloV/bWXI3YTVy6W0x7h3zGJnE785Txcd2otH93cvVL0L.png",
    id: "21",
    name: "rose",
    price: 15, 
    description: " The rose is a beautiful flowering plant belonging to the Rosaceae family. It is widely known and cultivated for its exquisite beauty, fragrance, and symbolic significance. Roses are native to various regions around the world and come in a diverse range of colors, including red, pink, white, yellow, and more.",
    isFavourite: false
    ),
    ProductModel(
    image: "https://arabcart1.com/wp-content/uploads/2022/10/Uj9n7wrmKU1666439282.png",
    id: "22",
    name: "Perfume",
    price: 20, 
    description: "Perfume is a fragrant liquid made from a combination of essential oils, aromatic compounds, and solvents. It is used to provide a pleasant scent to the body, clothing, or living spaces. Perfumes are created through a process called perfumery, which involves blending different fragrance notes to create a harmonious and unique aroma.",
    isFavourite: false
    ),
    ProductModel(
    image: "https://cdn.salla.sa/RVvww/MR9PRjDZEMHZJ34k0lfPWr3Un5JS5ZsxCMH813WY.png",
    id: "23",
    name: "wristwatch",
    price: 15, 
    description: " A wristwatch, often simply referred to as a watch, is a timekeeping device worn on the wrist. It consists of a case, which houses the mechanism and dial, and a strap or bracelet that secures it to the wrist",
    isFavourite: false
    ),
    ProductModel(
    image: "https://www.pngplay.com/wp-content/uploads/9/Leather-Wallet-PNG-Photo-Image.png",
    id: "24",
    name: "wallet",
    price: 5, 
    description: "A wallet is a small, flat, and typically pocket-sized accessory used to hold and organize various personal items such as cash, identification cards, credit cards, and other essentials. It is designed to provide a convenient and secure way to carry and access these items",
    isFavourite: false
    ),

    ProductModel(
    image: "https://play-lh.googleusercontent.com/FKmHsX0DowsrUaP93-g9yiqOMNDljDLqnHAFjiMjJB4-u9oBii6QoQBQKTY0O2T2nWg=w600-h300-pc0xffffff-pd",
    id: "25",
    name: "Photo frame",
    price: 8, 
    description: " A photo frame, also known as a picture frame, is a decorative item used to display and protect photographs or artworks. It typically consists of a rigid frame with a transparent cover, such as glass or plastic, that encloses the photo",
    isFavourite: false
    ),

    ProductModel(
    image: "https://play-lh.googleusercontent.com/gFl_O4F0PvafVzTZNvDJ1q8tQnCGOBDJw6unOkq5SyRIgexpuFSB8A650aGyK8oItfs=w240-h480-rw",
    id: "26",
    name: "wall clock",
    price: 20, 
    description: "wall clock is a timekeeping device designed to be mounted on a wall. It typically consists of a clock face, which displays the time through hour, minute, and sometimes second hands, and a housing that encloses the clock mechanism.",
    isFavourite: false
    ),
];