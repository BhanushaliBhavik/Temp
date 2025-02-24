import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDGBdd61kRdK_N_c7quJZxd7t4EywkGyAE",
            authDomain: "backend-in7gy7.firebaseapp.com",
            projectId: "backend-in7gy7",
            storageBucket: "backend-in7gy7.firebasestorage.app",
            messagingSenderId: "708438594834",
            appId: "1:708438594834:web:c4528a3e617effba154fcb"));
  } else {
    await Firebase.initializeApp();
  }
}
