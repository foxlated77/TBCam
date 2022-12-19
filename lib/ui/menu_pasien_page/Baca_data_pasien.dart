import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tutor1/ui/menu_dokter_page/add_data_obat.dart';
import 'package:tutor1/ui/menu_pasien_page/Detail_informasi_obat.dart';





class Baca_data_pasien extends StatefulWidget {
  Baca_data_pasien({Key? key, required this.kode_kses, required this.nama_user}) : super(key: key);
  final String kode_kses;
  final String nama_user;

  @override
  _Baca_data_pasienState createState() => _Baca_data_pasienState();
}

class _Baca_data_pasienState extends State<Baca_data_pasien> {
  CollectionReference? user;
  String? datauser;
  late final Stream<QuerySnapshot> getdeta;
  final TextEditingController kode = TextEditingController();
  @override
  void initState() {

    user = FirebaseFirestore.instance.collection("Informasi_Obat");
    getdeta = FirebaseFirestore.instance.collection("Informasi_Obat").snapshots();
    data();
    // TODO: implement initState
    super.initState();
  }
  Future data ()async{
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        data();
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold
        (
        appBar: AppBar(
          title: Text("Halo , Dr. " +widget.nama_user.toString()),
        ),
        body: SingleChildScrollView(

            child: StreamBuilder<QuerySnapshot>(
                stream: getdeta,
                builder:  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("error");
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: CircularProgressIndicator(),
                        ));
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> userData = snapshot.data!.docs[index]
                              .data() as Map<String, dynamic>;
                          return SingleChildScrollView(
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
                                          leading:  Image.asset('images/person.png'),
                                          title: Text(
                                            //menampilkan data judul
                                            "Nama : " + userData["Nama_Pasien"],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          onTap: (){
                                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Detail_informasi_obat(id_obat: id_obat, NIK: NIK, status: status, alamat: alamat, umur: umur, alergi_obat: alergi_obat, berat_badan: berat_badan, jenis_kelamin: jenis_kelamin, nomor_hp: nomor_hp, tanggal_lahir: tanggal_lahir, tinggi_badan: tinggi_badan)))
                                            showDialog<String>(
                                                context: context,
                                                builder: (BuildContext context) => AlertDialog(
                                                  title: const Text('Perhatian'),
                                                  content: const Text('Silahkan masukan kode akses'),
                                                  actions: <Widget>[
                                                    new Expanded(
                                                      child: new TextField(
                                                        controller: kode,
                                                        autofocus: true,
                                                        decoration: new InputDecoration(
                                                            labelText: 'Kode Akses', hintText: 'Kode Akses'),
                                                      ),

                                                    ),
                                                    TextButton(
                                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                                      child: const Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        if(kode.text ==userData['id_obat']){
                                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail_informasi_obat(
                                                            Nama_Pasien: userData["Nama_Pasien"],
                                                            Fase_Pengobatan: userData["Fase_Pengobatan"],
                                                            Nama_obat: userData["Nama_obat"],
                                                            Dosis: userData["Dosis"],
                                                            Catatan: userData["Catatan"],
                                                            id_obat: userData["id_obat"],
                                                          )));
                                                        }
                                                        else
                                                        {
                                                          showDialog<String>(
                                                              context: context,
                                                              builder: (BuildContext context) => AlertDialog(
                                                                title: const Text('Perhatian'),
                                                                content: const Text('Id yang anda masukan salah silahkan ulangi kembali'),
                                                                actions: <Widget>[
                                                                  TextButton(
                                                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                                                    child: const Text('Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () => Navigator.pop(context, 'OK'),
                                                                    child: const Text('OK'),
                                                                  ),
                                                                ],
                                                              ));
                                                        }
                                                      },
                                                      child: const Text('OK'),
                                                    ),
                                                  ],
                                                ));
                                          },
                                          subtitle: Column(
                                              children: [
                                                SizedBox(height: 6,),
                                                Row(
                                                  children: [
                                                    Text(
                                                      //menampilkan deskripsi berita
                                                      "Nama obat : " + userData["Nama_obat"],
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 8,),

                                              ])
                                      )
                                  )
                              )
                          );

                        });
                  }
                  ;
                  return Text("data");
                }
            )
        ),
      ),
    );
  }
  Future<void> deleteuser(String id) {
    return user!
        .doc(id)
        .delete(); // when we store data by our id then use set method
  }
}