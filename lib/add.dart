import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';



class Adduser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Adduser_state();
}

class Adduser_state extends State<Adduser> {
  final CollectionReference login=FirebaseFirestore.instance.collection('doner');

  void adduser(){

  }

  @override
  GlobalKey<FormState> formkey=GlobalKey();
  bool showpass=true;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("",style: TextStyle(fontSize: 30),),
        ),

        body:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),
              labelText:"Donar Name",)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                labelText:"Phone nomber",)),
            ),
            ElevatedButton(onPressed: (){}, child: Text("submit"),style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(150,50)),backgroundColor: MaterialStateProperty.all(Colors.red))
            
            )])
    );
  }
}

