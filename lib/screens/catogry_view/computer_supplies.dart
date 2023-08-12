import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../models/product_modle/product_modle.dart';
import '../product_details/product_details.dart';

class ComputerSupplies extends StatefulWidget {
  const ComputerSupplies({super.key});

  @override
  State<ComputerSupplies> createState() => _ComputerSuppliesState();
}

class _ComputerSuppliesState extends State<ComputerSupplies> {
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
                      itemCount: computerProduct.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.85,
                        crossAxisCount: 2),
                      itemBuilder: (ctx,index){
                        ProductModel singleProduct = computerProduct[index];
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



List<ProductModel> computerProduct=[
    

    ProductModel(
    image: "https://cdn.shopify.com/s/files/1/0012/4957/4961/products/60pinkkeyboard.png?v=1629445095",
    id: "11",
    name: "Keyboard",
    price: 15, 
    description: " A keyboard is a primary input device for computers and other electronic devices that allows users to enter text, commands, and various inputs. It consists of a set of buttons or keys, each representing a specific character, function, or command",
    isFavourite: false),

    ProductModel(
    image: "https://cdn.shopify.com/s/files/1/0549/2681/products/glorious_model_o_wired_full_size_black_matte_6_grande.webp?v=1676048663",
    id: "12",
    name: "mouse",
    price: 10, 
    description: " Computer supplies refer to various items and components that are used in conjunction with computers and computer systems to enhance their functionality, improve performance, and facilitate efficient operation",
    isFavourite: false),

    ProductModel(
    image: "https://www.matjarkom.com/image/cache/mpseller/customer-12487/mia_1-500x500.webp",
    id: "13",
    name: "bag",
    price: 5, 
    description: " A computer bag, also known as a laptop bag or laptop case, is a specially designed bag or case used to carry and protect laptops or other portable computers. It is designed to provide secure storage and transportation for laptops while offering additional compartments for accessories and personal belongings.",
    isFavourite: false),

    ProductModel(
    image: "https://btech.com/cdn-cgi/image/quality=50,format=auto/media/catalog/product/cache/472383e37f6cd95ca4a09ee1de419173/1/-/1-vt5000-banner-main-1.jpg",
    id: "14",
    name: "headphones",
    price: 8, 
    description: "Headphones, also known as earphones or headsets, are audio devices worn over or in the ears to listen to sound privately",
    isFavourite: false),


    ProductModel(
    image: "https://cdn.salla.sa/PD9czvTO1CesRGPMvbv5UZhKA5qpyimixqXKWWED.png",
    id: "15",
    name: "Flash",
    price: 20, 
    description: " Flash refers to a few different concepts depending on the context. Here are brief descriptions of two common meanings of the term",
    isFavourite: false),



    ProductModel(
    image: "https://cdn.salla.sa/qqRYZ/s2cnpU36IywrfXAwtqnVBiVTvBSKV4aFHcwDkWZ9.png",
    id: "16",
    name: "microphone",
    price: 5, 
    description: "A computer microphone, often referred to as a mic, is an audio sensing device used to record sound or make voice calls through a computer. It is typically connected to the computer via a USB port or a 3.5mm microphone audio jack.",
    isFavourite: false),



    ProductModel(
    image: "https://umqstore.com/wp-content/uploads/2022/09/fc431096-0f83-42e4-8df4-e3c3ad605e28-400x400.png",
    id: "17",
    name: "mouse",
    price: 5, 
    description: " Computer supplies refer to various items and components that are used in conjunction with computers and computer systems to enhance their functionality, improve performance, and facilitate efficient operation",
    isFavourite: false),

    ProductModel(
    image: "https://d4ns.com/image/cache/catalog/icons/mobile/lan-128x128.png",
    id: "18",
    name: "cable",
    price: 6, 
    description: " A cable is a flexible and usually insulated wire or combination of wires used to transmit electrical signals or transfer data between devices. Cables are commonly used for connecting various electronic devices and components, such as computers, televisions, speakers, and peripherals.",
    isFavourite: false),

    
];