import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD9mQE6YYIVuMbru8ov01ZyjkzIas8Vv4I",
            authDomain: "testruta-f324b.firebaseapp.com",
            projectId: "testruta-f324b",
            storageBucket: "testruta-f324b.appspot.com",
            messagingSenderId: "737074354006",
            appId: "1:737074354006:web:5070e447738d34ed40e8f7"));
  } else {
    await Firebase.initializeApp();
  }
}
