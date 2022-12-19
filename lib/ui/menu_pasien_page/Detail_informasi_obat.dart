import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class Detail_informasi_obat extends StatefulWidget {
  Detail_informasi_obat({Key? key, required this.id_obat,  required this.Nama_Pasien,required this.Fase_Pengobatan , required this.Nama_obat, required this.Dosis, required this.Catatan}) : super(key: key);
  final String Nama_Pasien;
  final String Fase_Pengobatan;
  final String Nama_obat;
  final String Dosis;
  final String Catatan;
  final String id_obat;

  @override
  _Detail_informasi_obatState createState() => _Detail_informasi_obatState();
}

class _Detail_informasi_obatState extends State<Detail_informasi_obat> {
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
                            SizedBox(height: 20,),
                            Image.asset("images/person.png", height: 100,width: 100,),
                            SizedBox(height: 10,),
                            Text("Halo, ${widget.Nama_Pasien}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Text("Welcome to TB Dashboard", style: TextStyle(fontSize: 15),),
                            SizedBox(height: 10,),
                            Text("Informasi Obat", style: TextStyle(fontSize: 20),),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 50,),
                            Text("Nama Lengkap                       : " + widget.Nama_Pasien),
                            SizedBox(height: 10,),
                            Text("Fase Pengobatan                    : " + widget.Fase_Pengobatan),
                            SizedBox(height: 10,),
                            Text("Nama Obat                              : " + widget.Nama_obat),
                            SizedBox(height: 10,),
                            Text("Dosis                                        : " + widget.Dosis),
                            SizedBox(height: 10,),
                            Text("Catatan Dokter                       : " + widget.Catatan),
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