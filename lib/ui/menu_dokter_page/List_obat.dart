import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tutor1/ui/menu_dokter_page/add_data_obat.dart';





class List_obat extends StatefulWidget {
  List_obat({Key? key, required this.kode_kses, required this.nama_user}) : super(key: key);
  final String kode_kses;
  final String nama_user;

  @override
  _List_obatState createState() => _List_obatState();
}

class _List_obatState extends State<List_obat> {
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
    // datauser == FirebaseFirestore.instance
    //     .collection('Pasien')
    //     .doc('1666260111268835');

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
          actions: [
            IconButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>add_informasi_obat()));
            }, icon: Icon(Icons.add))
          ],
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