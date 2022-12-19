import 'package:flutter/material.dart';
import 'package:tutor1/ui/menu_dokter_page/menu_dokter_page.dart';
import 'package:tutor1/ui/menu_pasien_page/menu_pasien.dart';


class kode_akses extends StatefulWidget {
 kode_akses({Key? key, required this.name}) : super(key: key);
  String name;

  @override
  State<kode_akses> createState() => _kode_aksesState();
}


class _kode_aksesState extends State<kode_akses> {
  TextEditingController kd_akses =TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    kd_akses;
    setState(() {
      widget.name;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(45),
            child:
            Column(
              children:
              [
                SizedBox(height: 100),
                Image.asset("images/cc.png",width: 100,),
                SizedBox(height: 10),
                Text("TBCam",style: TextStyle( fontSize: 20,fontStyle: FontStyle.italic,color: Colors.blueGrey[800] ),),
                SizedBox(height: 50),
                SizedBox(
                  child: Text('Masukkan kode akses anda', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,)),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Text("Hello, " + widget.name?? "--",textAlign: TextAlign.center, style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),),
                ),
                SizedBox(height: 50),
                TextField(
                  controller: kd_akses,
                  decoration: InputDecoration(
                      hintText: "Kode Akses",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: (
                  SizedBox( width: 270,
                    child:
                    ElevatedButton(
                      child:
                      Icon(Icons.check, color: Colors.white, size: 30,),
                      onPressed: () {
                        print("kd_akses");
                        print(kd_akses.text);
                        if(kd_akses.text.toString() == "123456") {
                          if(widget.name == "914722655"){
                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => menu_pasien(nama: widget.name,)));
                          }
                          else {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Gagal Login'),
                                  content: const Text('Kode Akses yang anda masukkan salah!'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ));
                          }
                         }
                        else if(kd_akses.text.toString() == "111111"){
                          if(widget.name == "631266327" ){
                          Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) =>List_pasien(kode_kses: '', nama_user: widget.name)));
                          }
                          else {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Gagal Login'),
                                  content: const Text('Kode Akses yang anda masukkan salah!'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ));
                          }
                        }
                        else if(kd_akses.text.toString() == "222222"){
                          if(widget.name == "6214814033"){
                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) =>menu_pasien(nama: widget.name)));
                          }
                          else {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Gagal Login'),
                                  content: const Text('Kode Akses yang anda masukkan salah!'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ));
                          }
                        }
                        else {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Gagal Login'),
                                content: const Text('Kode Akses yang anda masukkan salah!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ));
                        }

                      },
                      style: ElevatedButton.styleFrom( // returns ButtonStyle
                        primary: Colors.indigo[800],
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  )
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
