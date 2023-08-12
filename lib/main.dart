import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:library_project/constants/theme.dart';
import 'package:library_project/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:library_project/firebase_helper/firebase_options/firebase_options.dart';
import 'package:library_project/provider/app_provider.dart';
import 'package:library_project/screens/auth_ui/welcom/welecom.dart';
import 'package:library_project/screens/coustom_bottom_bar/coustom_bottom_bar.dart';
import 'package:provider/provider.dart';


void main() async {
WidgetsFlutterBinding.ensureInitialized();
Stripe.publishableKey =
  "pk_test_51MWx8OAVMyklfe3CsjEzA1CiiY0XBTlHYbZ8jQlGtVFIwQi4aNeGv8J1HUw4rgSavMTLzTwgn0XRlwoTVRFXyu2h00mRUeWmAf";


await Firebase.initializeApp(
  options: DefaultFirebaseConfig.platformOptions,
);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>AppProvider() ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'library_project',
        theme: themeData,
        home: StreamBuilder(
          stream: FirebaseAuthHelper.instance.getAuthChange,
          builder: (context,snapshot) {
            if(snapshot.hasData){
              return const CustomBottomBar();
            }
            return const Welcome();
    
          },
        )
      ),
    );
  }
}

