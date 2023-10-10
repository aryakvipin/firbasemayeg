import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget{
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final CollectionReference login=FirebaseFirestore.instance.collection('doner');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Blood Donarion App"),
      backgroundColor: Colors.red,),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, '/add');
      },
        backgroundColor: Colors.red,
        child: Icon(Icons.add,size: 30,),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    body: StreamBuilder(
        stream: login.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context,index){
              final DocumentSnapshot donersnap=snapshot.data!.docs[index];
              return Card(child:
              ListTile(
                title: Text(donersnap['name'],
                ),
                subtitle: Text(donersnap['phone']
                ),
                trailing: Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                  ],
                ),
              ));
            },itemCount:snapshot.data!.docs.length ,);
          }
          // snapshot.data is QuerySnapshot than I access .docs to get List<QueryDocumentSnapshot>
      return Container(child: Text(""),);
        }),
    );
  }
}