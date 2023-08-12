

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_project/constants/routes.dart';
import 'package:library_project/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:library_project/models/catogary_mdel/catogary_mdel.dart';
import 'package:library_project/provider/app_provider.dart';
import 'package:library_project/screens/catogry_view/all_product.dart';
import 'package:library_project/screens/product_details/product_details.dart';
import 'package:provider/provider.dart';
import '../../models/product_modle/product_modle.dart';
import '../../widgets/top_titles/top_titles.dart';
import '../catogry_view/computer_supplies.dart';
import '../catogry_view/gifts.dart';
import '../catogry_view/makeup.dart';
import '../catogry_view/printing_supplies.dart';
import '../catogry_view/stationery.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel>categorisList=[];
  List<ProductModel> productModelList=[];

  bool isLoading=false;
  void initiState(){
    AppProvider appProvider =Provider.of<AppProvider>(context,listen: false);
    appProvider.getUserInfoFirebase();
    super.initState();
    getCategoryList();
  }
  void getCategoryList()async{
    setState(() {
      isLoading=true;
    });
    FirebaseFirestoreHelper.instance.updateTpkenFromFirebase();
   categorisList= await FirebaseFirestoreHelper.instance.getCategories();
   productModelList= await FirebaseFirestoreHelper.instance.getBestProduct();

   isLoading=false;
  }
  TextEditingController search=TextEditingController();
  List<ProductModel> searchList=[];
  void SearchProducts(String value){
  searchList=  allProduct.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
  setState(() {
    
  });

  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      
      body:isLoading?Center(child:
      Container(
        height:100 ,
        width: 100,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),) 
      :SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopTitles(title: "lyprary", subtitile: ""),
                  TextFormField(
                    controller: search,
                    onChanged: (String value){
                      SearchProducts(value);
                    },
                    decoration: const InputDecoration(
                      hintText: "Search..."
                    ),
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 12,),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("categories",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,),),
            ),

            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //     categorisList.map((e) => Padding(padding: EdgeInsets.only(left: 8.0),
            //     child: Card(
            //       color: Colors.white,
            //       elevation: 3.0,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20.0),
                    
            //       ),
            //       child: SizedBox(
            //         height: 100,
            //         width: 100,
            //         child: Image.network(e.Image),
            //       ),
            //     ),
                
            //     ))],
            //   ),
            // ),
          
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:[
                 Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Routes.instance.push(widget: const Stationery(), context: context);
                  },
                  child: Card(
                    elevation: 6.0,
                    color: Colors.white,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child:  SizedBox(
                      height: 100, width:100,
                      child: Image.network(
                         "https://static.vecteezy.com/system/resources/previews/011/994/326/non_2x/learning-and-reading-concept-stationery-accessories-vector.jpg"
                        ,),
                      
                    ),
                  ),
                ),
              ),
          
               Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Routes.instance.push(widget: const ComputerSupplies(), context: context);
                  },
                  child: Card(
                    elevation: 6.0,
                    color: Colors.white,
                    shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    ),
                    child:  SizedBox(
                      height: 100, width:100,
                      child: Image.network("https://static.vecteezy.com/system/resources/previews/009/351/552/non_2x/office-work-equipment-pc-gadget-png.png",)
                      
                    ),
                  ),
                ),
              ),
          
               Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Routes.instance.push(widget: const Gifts(), context: context);
                  },
                  child: Card(
                    elevation: 6.0,
                    color: Colors.white,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child:  SizedBox(
                      height: 100, width:100,
                      child: Image.network("https://static.vecteezy.com/system/resources/previews/011/809/089/non_2x/christmas-gift-red-box-with-bow-png.png",)
                      
                    ),
                  ),
                ),
              ),
          
               Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Routes.instance.push(widget: const Makeup(), context: context);
                  },
                  child: Card(
                    elevation: 6.0,
                    color: Colors.white,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child:  SizedBox(
                      height: 100, width:100,
                      child: Image.network("https://static.vecteezy.com/system/resources/previews/019/152/527/original/cosmetic-graphic-clipart-design-free-png.png",)
                      
                    ),
                  ),
                ),
              ),
          
               Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Routes.instance.push(widget: const PrintingSupplies(), context: context);
                  },
                  child: Card(
                    elevation: 6.0,
                    color: Colors.white,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child:  SizedBox(
                      height: 100, width:100,
                      child: Image.network("https://static.vecteezy.com/system/resources/previews/003/329/419/non_2x/line-icon-for-print-supplies-vector.jpg",)
                      
                    ),
                  ),
                ),
              ),
              ],
            ),
          ), 
          const SizedBox(height: 12.0,),
        !isSearched()?  const Padding(
              padding: EdgeInsets.only(left: 12,right: 12.0,top: 12.0),
              child: Text("Best Product",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,),),
            ): SizedBox.fromSize(),
      
            const SizedBox(height: 12.0,),
            search.text.isNotEmpty&&searchList.isEmpty?const Center(child: Text("No Product Found"),):searchList.isNotEmpty&&search.text.isNotEmpty?
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 50),
                shrinkWrap: true,
                primary: false,
                itemCount: searchList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.85,
                  crossAxisCount: 2),
                itemBuilder: (ctx,index){
                  ProductModel singleProduct = searchList[index];
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
            ):
            
            // ProductModelList.isEmpty? const Center(child: Text("Best Product is empty"),)
            // :
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 50),
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
           
            
          ],
        ),
      ),
    );
  }

  bool isSearched(){
    if(search.text.isNotEmpty&&searchList.isEmpty ){
      return true;
    }
    else if(search.text.isEmpty&&searchList.isNotEmpty){
      return false;
    }
    else if(searchList.isNotEmpty){
      return true;

    }
    else {
      return false;
    }
  }
}







  List<ProductModel> bestProduct=[
     ProductModel(
    image: "https://ssl-product-images.www8-hp.com/digmedialib/prodimg/lowres/c06628102.png",
    id: "40",
    name: "printer",
    price: 100, 
    description: "A printer is a peripheral device used to produce physical copies of digital documents or images. It takes electronic data from a computer or other devices and transfers it onto paper or other media.",
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
];