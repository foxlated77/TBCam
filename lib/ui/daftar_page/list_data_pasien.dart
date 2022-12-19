import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'detail_data_pasien.dart';



class Read_all_data_pasien extends StatefulWidget {
  Read_all_data_pasien({Key? key, required this.kode_kses, required this.nama_user}) : super(key: key);
  final String kode_kses;
  final String nama_user;

  @override
  _Read_all_data_pasienState createState() => _Read_all_data_pasienState();
}

class _Read_all_data_pasienState extends State<Read_all_data_pasien> {
  CollectionReference? user;
  String? datauser;
  late final Stream<QuerySnapshot> getdeta;
  final TextEditingController kode = TextEditingController();
  @override
  void initState() {

    user = FirebaseFirestore.instance.collection("Pasien");
    getdeta = FirebaseFirestore.instance.collection("Pasien").snapshots();
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
          title: Text("Halo, " +widget.nama_user.toString()),
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
                                            "Nama : " + userData["Nama"],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          onTap: (){
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
                                                        if(kode.text ==userData['id']){
                                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail_data_pasien(
                                                            nama: userData["Nama"],
                                                            NIK: userData["NIK"],
                                                            status: userData["Status_Pengobatan"],
                                                            alamat:  userData["Alamat"],
                                                            umur: userData["Umur"],
                                                            alergi_obat: userData["Alergi_Obat"],
                                                            nomor_hp: userData["Nomor HP "],
                                                            // nomor_hp:userData["Nomor HP"] ,
                                                            berat_badan: userData["Berat_Badan"],
                                                            // jenis_kelamin: "",
                                                            jenis_kelamin: userData["Jenis_Kelamin"],
                                                            tanggal_lahir: userData["Tanggal_Lahir"],
                                                            tinggi_badan: userData["Tinggi_Badan"],
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
                                                      "Alamat : " + userData["Alamat"],
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 8,),
                                                Row(
                                                    children: [
                                                      Icon(Icons.accessibility),
                                                      Text(
                                                        //menampilkan deskripsi berita
                                                        userData["Tinggi_Badan"],
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Icon(Icons.wifi_protected_setup_sharp),
                                                      SizedBox(width: 5,),
                                                      Text(
                                                        //menampilkan deskripsi berita
                                                        userData["Berat_Badan"] ,
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ])
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