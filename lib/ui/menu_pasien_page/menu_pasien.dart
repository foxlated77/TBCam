import 'package:flutter/material.dart';
import 'package:tutor1/Laporan_minum_obat/list_item.dart';
import 'package:tutor1/ui/daftar_page/list_data_pasien.dart';
import 'package:tutor1/ui/menu_pasien_page/Baca_data_pasien.dart';
import 'package:tutor1/ui/scan_rfid_page/scan_rfid.dart';



class menu_pasien extends StatefulWidget {
  menu_pasien({Key? key, required this.nama}) : super(key: key);
  String? nama;
  @override
  _menu_pasienState createState() => _menu_pasienState();
}

class _menu_pasienState extends State<menu_pasien> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                child:  Column(
                  children: [
                    SizedBox(height: 20,),
                    Image.asset("images/cc.png", height: 80,width: 80,),
                    SizedBox(height: 20,),
                    Text("Halo, ${widget.nama}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text("Welcome to TB Dashboard", style: TextStyle(fontSize: 15),),
                    SizedBox(height: 15,),
                    Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child:  GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Read_all_data_pasien(kode_kses: '', nama_user: widget.nama.toString())));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'images/rm_btn.png',
                                    height: 175,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 55, left: 205),
                                        child:Text(
                                          'Rekam\n Medis',textAlign: TextAlign.right,
                                          style: TextStyle(color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.0),
                                        )
                                    )),
                                // Image.asset("images/rekam.jpeg",height: 200,width: 300,),
                                // Text("Rekam Medis", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                              ],
                            )
                        )
                    ),
                    SizedBox(height: 10,),
                    Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child:
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemList()));
                            },
                            child:Stack(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'images/time_btn.png',
                                    height: 175,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 40, left: 195),
                                        child:Text(
                                          'Laporan\nMinum\nObat',textAlign: TextAlign.right,
                                          style: TextStyle(color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.0),
                                        )
                                    )),
                                // Image.asset("images/rekam.jpeg",height: 200,width: 300,),
                                // Text("Rekam Medis", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                              ],
                            ))
                    ),
                    SizedBox(height: 10,),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child:
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Baca_data_pasien(kode_kses: '', nama_user: widget.nama.toString())));
                          },
                          child:Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'images/Info_btn.png',
                                  height: 175,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: EdgeInsets.only(top: 55, left: 175),
                                      child:Text(
                                        'Informasi\n Obat',textAlign: TextAlign.right,
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0),
                                      )
                                  )),
                              // Image.asset("images/rekam.jpeg",height: 200,width: 300,),
                              // Text("Rekam Medis", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                            ],
                          )
                      ),)
                  ],
                ),
              )

          ),
        ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
            showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Action'),
                        content: const Text('Apakah anda yakin ingin keluar?'),
                        actions: <Widget>[
                          Column(
                            children: [
                              TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>scan_rfid()));
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          )
                        ],
                      ));
            },
            // label: const Text('Approve'),
            backgroundColor: Colors.indigo[800],
            child: const Icon(Icons.exit_to_app),
          ),
      ),
    );
  }
}