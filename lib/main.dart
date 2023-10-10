
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'add.dart';
import 'homepage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
         return MaterialApp(title: "Demo App",
         routes: {
      '/':(context) =>Homepage(),
      '/add':(context)=>Adduser(),
      },
      initialRoute: '/',);
      }



}

