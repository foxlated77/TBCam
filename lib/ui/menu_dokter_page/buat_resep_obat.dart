import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor1/bloc/dokter_bloc/dokter_blocs.dart';
import 'package:tutor1/bloc/dokter_bloc/dokter_events.dart';
import 'package:tutor1/bloc/dokter_bloc/dokter_states.dart';



class Buat_informasi_obat extends StatefulWidget {
  const Buat_informasi_obat({Key? key}) : super(key: key);

  @override
  _Buat_informasi_obatState createState() => _Buat_informasi_obatState();
}

class _Buat_informasi_obatState extends State<Buat_informasi_obat> {
  final TextEditingController _nama_pasien = TextEditingController();
  final TextEditingController _fase_pengobatan = TextEditingController();
  final TextEditingController _nama_obat = TextEditingController();
  final TextEditingController _dosis = TextEditingController();
  final TextEditingController _catatan = TextEditingController();
  final TextEditingController _id_obat = TextEditingController();

  DokterBloc? dokterBloc;
  int? select = -1;
  void onchanged(int? value){
    setState(() {

      this.select = value;
    });

  }

  Future<void> _create() async {
    setState(() {

    });
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Form Isian", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),),
                    SizedBox(height: 40,),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Nama Pasien", textAlign: TextAlign.left,),
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      controller: _nama_pasien,
                      decoration: InputDecoration(
                          hintText: "Nama pasien",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Fase Pengobatan", textAlign: TextAlign.left,),
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      controller: _fase_pengobatan,
                      decoration: InputDecoration(
                          hintText: "Fase Pengobatan",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Nama obat", textAlign: TextAlign.left,),
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      controller: _nama_obat,
                      decoration: InputDecoration(
                          hintText: "Nama obat",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Dosis yang direkomendasikan", textAlign: TextAlign.left,),
                    ),
                    TextField(
                      controller: _dosis,
                      decoration: InputDecoration(
                          hintText: "Dosis yang direkomendasikan",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Catatan", textAlign: TextAlign.left,),
                    ),
                    TextField(
                      controller: _catatan,
                      decoration: InputDecoration(
                          hintText: "Catatan",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "ID Obat", textAlign: TextAlign.left,),
                    ),
                    TextField(
                      controller: _id_obat,
                      decoration: InputDecoration(
                          hintText: "ID Obat",
                          border: OutlineInputBorder()
                      ),
                    ),


                    ElevatedButton(onPressed: () {
                      _postData(context);
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Myhome()));
                    },
                        child: Text("Simpan Data"))

                  ],
                ),
              )
          );

        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input informasi obat"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                // Navigator.push(
                //   context, MaterialPageRoute(builder: (_) => Myhome()));
                },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1)),
          initialData: DokterState,
          builder: (context, snapshot) {
            return SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child:  Column(
                        children: [
                          Text("Form Isian obat", style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),),
                          SizedBox(height: 40,),



                          ElevatedButton(onPressed: () {
                            _create();
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Myhome()));
                          },
                              child: Text("Tambah data"))

                        ],
                      ),
                    )

                )
            );
          }

      ),
    );
  }
  void _postData(context) {
    BlocProvider.of<DokterBloc>(context).add(
      CreateDokter(_nama_pasien.text,_fase_pengobatan.text,_nama_obat.text, _dosis.text, _catatan.text,_id_obat.text ),
    );

  }

}