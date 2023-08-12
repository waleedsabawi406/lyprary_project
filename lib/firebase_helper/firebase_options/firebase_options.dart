

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig{
  static FirebaseOptions get platformOptions{
    if(Platform.isIOS){
      return const FirebaseOptions(apiKey: 'AIzaSyALD84WzxG6UwmMY_nDBsTDy7lDP3AVk64', appId: '', messagingSenderId: '', projectId: '');

    }else{
      return const FirebaseOptions(apiKey: 'AIzaSyALD84WzxG6UwmMY_nDBsTDy7lDP3AVk64', appId: '1:1096642746494:android:5fbdd17277247b45aee02f', messagingSenderId: '1096642746494', projectId: 'library-project-fa900');
    }

  }
}