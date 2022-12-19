import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class Detail_laporan extends StatefulWidget {
  Detail_laporan({Key? key, required this.harike, required this.tanggal, required this.check, required this.image}) : super(key: key);
  final String harike;
  final String tanggal;
  final String check;
  final String image;


  @override
  _Detail_laporanState createState() => _Detail_laporanState();
}

class _Detail_laporanState extends State<Detail_laporan> {
  CollectionReference? user;
  String? datauser;
  late final Stream<QuerySnapshot> getdeta;

  @override
  void initState() {



    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold
          (

            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                  padding: const EdgeInsets.only(left: 5, top:  20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 35,),
                            Text("Detail Laporan Minum obat", style: TextStyle(fontSize: 20),),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 20,right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 35,),
                            Container(
                              height: 500,
                              width: 400,
                              child: Card(
                                child: Image.network(
                                  widget.image,
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 5,
                                margin: EdgeInsets.all(10),
                              ),
                            ),
                            // Padding(padding: EdgeInsets.all(20),
                            //
                            // child:  Image.network(widget.image, height: 150, width: 250,),),
                            SizedBox(height: 10,),
                            Text("Hari Ke : " + widget.harike),
                            SizedBox(height: 10,),
                            Text("Tanggal : " + widget.tanggal),
                            SizedBox(height: 10,),
                            Text("Status Minum Obat : " + widget.check),
                            SizedBox(height: 10,),


                          ],
                        ),
                      )

                    ],
                  )
              ),
            )
        )
    );

  }
  Future<void> deleteuser(String id) {
    return user!
        .doc(id)
        .delete(); // when we store data by our id then use set method
  }
}