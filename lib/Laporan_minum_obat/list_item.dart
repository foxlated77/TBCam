import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tutor1/Laporan_minum_obat/detail_laporan.dart';


import 'add_item.dart';

class ItemList extends StatelessWidget {
  ItemList({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }

  CollectionReference _reference =
  FirebaseFirestore.instance.collection('Laporan_Minum_Obat');

  //_reference.get()  ---> returns Future<QuerySnapshot>
  //_reference.snapshots()--> Stream<QuerySnapshot> -- realtime updates
  late Stream<QuerySnapshot> _stream;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:       Scaffold(
        appBar: AppBar(
          title: Text('Items'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //Check error
            if (snapshot.hasError) {
              return Center(child: Text('Some error occurred ${snapshot.error}'));
            }

            //Check if data arrived
            if (snapshot.hasData) {
              //get the data
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> documents = querySnapshot.docs;

              //Convert the documents to Maps
              List<Map> items = documents.map((e) => e.data() as Map).toList();

              //Display the list
              return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    //Get the item at this index
                    Map thisItem = items[index];
                    //REturn the widget for the list items
                    return
                      //   SingleChildScrollView(
                      //     scrollDirection: Axis.vertical,
                      //     child: Padding(
                      //         padding: const EdgeInsets.only(left: 5, top:  1, right: 5),
                      //         child: Card(
                      //             elevation:5,
                      //             margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(0.0),
                      //             ),
                      //
                      //             child :
                      //             ListTile(
                      //               leading: Container(
                      //                 height: 80,
                      //                 width: 80,
                      //                 child: thisItem.containsKey('image') ? Image.network(
                      //                     '${thisItem['image']}') : Container(),
                      //               ),
                      //                 title: Text(
                      //                   //menampilkan data judul
                      //                   "Hari Ke : " + thisItem['name'],
                      //                   maxLines: 1,
                      //                   overflow: TextOverflow.ellipsis,
                      //                   style: const TextStyle(
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 20,
                      //                   ),
                      //                 ),
                      //                 onTap: (){
                      //
                      //
                      //                 },
                      //                 subtitle: Column(
                      //                     children: [
                      //                       SizedBox(height: 6,),
                      //                       Row(
                      //                         children: [
                      //                           Text(
                      //                             //menampilkan deskripsi berita
                      //                             "Tanggal : " + thisItem['quantity'],
                      //                             maxLines: 2,
                      //                             overflow: TextOverflow.ellipsis,
                      //                           ),
                      //                         ],
                      //                       ),
                      //                       SizedBox(height: 8,),
                      //
                      //                     ]),
                      //               trailing:    Row(
                      //                   children: [
                      //                     Icon(Icons.accessibility),
                      //                   ]),
                      //             )
                      //         )
                      //     )
                      // );
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, top:  1, right: 5),
                          child: Card(
                            elevation:5,
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),

                            child :
                            ListTile(
                              title:
                              Row(
                                children: [
                                  Text("Hari Ke : "),
                                  Text('${thisItem['hari']}'),
                                  SizedBox(width: 10,),
                                  if(thisItem['check'] == "ya")
                                    Icon(Icons.check_box,color: Colors.green,),
                                  if(thisItem['check'] == "tidak")
                                    Icon(Icons.close,color: Colors.red,)
                                ],
                              ),
                              subtitle:
                              Row(
                                children: [
                                  Text('Tanggal Minum Obat'),
                                  Text('${thisItem['date']}'),
                                ],
                              ),

                              leading: Container(
                                height: 80,
                                width: 80,
                                child: thisItem.containsKey('image') ? Image.network(
                                    '${thisItem['image']}') : Container(),
                              ),

                              onTap: () async {
                                // try {
                                //   final userCredential =
                                //   await FirebaseAuth.instance.signInAnonymously();
                                //   print("Signed in with temporary account.");
                                // } on FirebaseAuthException catch (e) {
                                //   switch (e.code) {
                                //     case "operation-not-allowed":
                                //       print("Anonymous auth hasn't been enabled for this project.");
                                //       break;
                                //     default:
                                //       print("Unknown error.");
                                //   }
                                // }
                                // print("photo");
                                // FirebaseStorage storage = FirebaseStorage.instance;
                                // Reference ref = storage.ref().child("images/176_photo");
                                // var url = await ref.getDownloadURL();
                                // print(url);
                                // });
                                // final ref = FirebaseStorage.instance.ref().child('images').child("176_photo");
                                // // no need of the file extension, the name will do fine.
                                // var url = await ref.getDownloadURL();
                                // print(ref);

                                Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_laporan(
                                  harike: thisItem["hari"],
                                  tanggal: thisItem["date"],
                                  check: thisItem["check"],
                                  image: thisItem["image"],)));
                              },
                            ),
                          ),
                        ),
                      );

                  });
            }

            //Show loader
            return Center(child: CircularProgressIndicator());
          },
        ), //Display a list // Add a FutureBuilder
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddItem()));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      )
    );

  }
}

