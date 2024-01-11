import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget{
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final CollectionReference login=FirebaseFirestore.instance.collection('doner');
void deleteuser(docid){
   login.doc(docid).delete();
}
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
        stream: login

            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context,index){
              final DocumentSnapshot donersnap=snapshot.data!.docs[index];
              return Card(
                child: Container(child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                           Image(image:  donersnap[0]["source"]
                           ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(donersnap['name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                          Text(donersnap["phone"],style: TextStyle(fontSize: 15),),
                          SizedBox(height: 20,)
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton( onPressed: () {
                          Navigator.pushNamed(context, '/update'
                          ,arguments: {
                             'name' :  donersnap['name'],
                              'phone':  donersnap['phone'],
                                'id':donersnap.id
                              });
                        }, icon:Icon(Icons.edit),),
                        IconButton( onPressed: () {
                          deleteuser(donersnap.id);
                        }, icon:Icon(Icons.delete),),                      ],
                    )
                  ],
                )),
              );
            },itemCount:snapshot.data!.docs.length ,);
          }
          // snapshot.data is QuerySnapshot than I access .docs to get List<QueryDocumentSnapshot>
      return Container(child: Text(""),);
        }),
    );
  }
}