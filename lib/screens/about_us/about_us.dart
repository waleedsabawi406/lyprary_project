import 'package:flutter/material.dart';

class AboutAs extends StatelessWidget {
  const AboutAs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(backgroundColor: Colors.white,title: const Text("About Us",style: TextStyle(color: Colors.black),),),
            body: const Padding(padding: EdgeInsets.all(12),
            child: Text("This project report presents the development of an Android mobile application using Flutter framework for creating an online store that specializes in selling stationery, office supplies, and computer accessories. The purpose of this project is to provide a convenient and user-friendly platform for customers to browse and purchase a wide range of products related to stationery, office supplies, and computer accessories.The problem this project addresses is the lack of a comprehensive and easily accessible online store that specifically caters to the needs of customers seeking stationery, office supplies, and computer accessories. By creating a mobile application, we aim to bridge this gap and offer a seamless shopping experience for users.The methodology followed for this project involved several steps. First, a detailed analysis of the requirements was conducted to identify the specific products to be sold and determine the necessary features and functionalities of the mobile application. Then, the application's design was carefully planned, considering user experience and interface design principles"
),),

    );
  }
}