import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class Detail_data_pasien extends StatefulWidget {
  Detail_data_pasien({Key? key, required this.nama, required this.NIK,required this.status,required this.alamat,required this.umur, required this.alergi_obat, required this.berat_badan, required this.jenis_kelamin, required this.nomor_hp, required this.tanggal_lahir, required this.tinggi_badan}) : super(key: key);
  final String nama;
  final String NIK;
  final String alamat;
  final String umur;
  final String status;

  final String berat_badan;
  final String alergi_obat;
  final String nomor_hp;
  final String tanggal_lahir;
  final String tinggi_badan;
  final String jenis_kelamin;


  @override
  _Detail_data_pasienState createState() => _Detail_data_pasienState();
}

class _Detail_data_pasienState extends State<Detail_data_pasien> {
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
                            Text("Halo, ${widget.nama}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Text("Welcome to TB Dashboard", style: TextStyle(fontSize: 15),),
                            SizedBox(height: 10,),
                            Text("Rekam Medis", style: TextStyle(fontSize: 20),),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 50,),
                            Text("Nama Lengkap                       : " + widget.nama),
                            SizedBox(height: 10,),
                            Text("NIK                                            : " + widget.NIK),
                            SizedBox(height: 10,),
                            Text("Alamat                                      : " + widget.alamat),
                            SizedBox(height: 10,),
                            Text("Nomor HP                                : " + widget.nomor_hp),
                            SizedBox(height: 10,),
                            Text("Umur                                         : " + widget.umur),
                            SizedBox(height: 10,),
                            Text("Berat Badan                             : " + widget.berat_badan),
                            SizedBox(height: 10,),
                            Text("Tinggi Badan                           : " + widget.tinggi_badan),
                            SizedBox(height: 10,),
                            Text("Tanggal Lahir                           : " + widget.tanggal_lahir),
                            SizedBox(height: 70,),
                            Text("Alergi Obat                               : " + widget.alergi_obat),
                            SizedBox(height: 10,),
                            Text("Status Pengobatan                 : " + widget.status),
                            SizedBox(height: 10,),
                            Text("Jenis Kelamin                          : " + widget.jenis_kelamin),

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