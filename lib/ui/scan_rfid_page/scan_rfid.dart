import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tutor1/kode_akses.dart';
import 'package:tutor1/ui/daftar_page/add_data_pasien.dart';


class scan_rfid extends StatefulWidget {
  const scan_rfid({Key? key}) : super(key: key);

  @override
  _scan_rfidState createState() => _scan_rfidState();
}

class _scan_rfidState extends State<scan_rfid> {
  late final dref = FirebaseDatabase.instance.reference();
  late DatabaseReference databaseReference;
  int _selectedIndex = 0;
  bool _visible = true;
  String? nilai_;
  showData() {
    dref.child("data").child("ID_user").once().then((snapshot) {
    });
    setState(() {

    });

    dref.once().then((snapshot) {
      print(snapshot.value);
    });
  }
  void _onItemTapped(int index) {
    showData();
    setState(() {
      _selectedIndex = index;
    });
  }



  Future getprofil() async {
    if(nilai_ == "914722655")
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> kode_akses(name: nilai_.toString(),)));
      pasien();}
    if(nilai_ == "6214814033")
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> kode_akses(name: nilai_.toString(),)));
      pasien();}
    if(nilai_ == "631266327")
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> kode_akses(name: nilai_.toString(),)));
      dokter();}
    // else if(nilai_ == "0"){}
    // else{
    //   showDialog<String>(
    //       context: context,
    //       builder: (BuildContext context) => AlertDialog(
    //         title: const Text('ID Tidak Terdaftar!'),
    //         content: const Text('SIlahkan scan kembali'),
    //         actions: <Widget>[
    //           TextButton(
    //             onPressed: () => Navigator.pop(context, 'OK'),
    //             child: const Text('OK'),
    //           ),
    //         ],
    //       ));
    // }
    dref.child("data").child("ID_user").once().then((snapshot) {
      nilai_ = snapshot.value.toString();
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        getprofil();
      });
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseReference = dref;
    // showData();
    getprofil();
    setState(() {

    });
    Future.delayed(const Duration(seconds: 1), () {
      //asynchronous delay
      if (this.mounted) {
        //checks if widget is still active and not disposed
        setState(() {
          //tells the widget builder to rebuild again because ui has updated
          _visible =
          false; //update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body:  SingleChildScrollView
            (
            child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 100,),
                    Image.asset("images/person.png", height: 200,width: 200,),
                    SizedBox(height: 10,),
                    Text("TBCam", style: TextStyle(fontSize: 20),),
                    FirebaseAnimatedList(
                        shrinkWrap: true,
                        query: databaseReference,
                        itemBuilder: (BuildContext context, DataSnapshot snapshot,
                            Animation animatio, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(top: 50)),
                              Text(
                                snapshot.value['ID_user'].toString(),
                                style: TextStyle(fontSize: 25, color: Colors.black),
                              ),
                            ],
                          );
                        }),
                    SizedBox(height: 50,),
                    Card(
                        clipBehavior: Clip.antiAlias,
                        child:  Column(
                          children: [
                            Image.asset("images/img.png",height: 250,width: 300,),
                            Text("Scan Your Card to Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            SizedBox(height: 50,),
                          ],
                        )
                    ),
                    ElevatedButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>add_data_pasien()));}, child: Text("Register"))


                  ],
                ),
            )
          ),
        )
    );
  }
  pasien(){
    print("pasien");
  }
  dokter(){
    print("dokter");
  }
}
