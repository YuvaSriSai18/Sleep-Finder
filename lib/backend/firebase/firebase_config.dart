import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCb0VVrYOQEMZZETogZA4iL-YTj2_1zTHQ",
            authDomain: "sleeptracker-b4237.firebaseapp.com",
            projectId: "sleeptracker-b4237",
            storageBucket: "sleeptracker-b4237.appspot.com",
            messagingSenderId: "366100025495",
            appId: "1:366100025495:web:38ca69912c97997ecc99d2",
            measurementId: "G-DVNY8WF8EV"));
  } else {
    await Firebase.initializeApp();
  }
}
