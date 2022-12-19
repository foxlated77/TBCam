import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor1/bloc/pasien_bloc/pasien_blocs.dart';
import 'package:tutor1/bloc/pasien_bloc/pasien_events.dart';
import 'package:tutor1/utils/file_auth.dart';
import 'package:tutor1/utils/validator.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  final TextEditingController _nama = TextEditingController();
  final TextEditingController _nik = TextEditingController();
  final TextEditingController _tanggal_lahir = TextEditingController();
  final TextEditingController _umur = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  final TextEditingController _nomor_hp = TextEditingController();
  final TextEditingController _tinggi_badan = TextEditingController();
  final TextEditingController _berat_badan = TextEditingController();
  final TextEditingController _alergi_obat= TextEditingController();
  final TextEditingController _status_pengobatan = TextEditingController();
  final TextEditingController _jenin_kelamin = TextEditingController();
  final TextEditingController _id_akses = TextEditingController();

  int? select = -1;
  void onchanged(int? value){
    setState(() {

      if(value ==0){
        _jenin_kelamin.text == "Pria";
      }else{
        _jenin_kelamin.text == "Wanita";
      }
      this.select = value;
    });

  }
  Future<void> _create() async {

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("PENDAFTARAN", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),),
                    SizedBox(height: 40,),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Nama Lengkap", textAlign: TextAlign.left,),
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      controller: _nama,
                      decoration: InputDecoration(
                          hintText: "Nama Lengkap",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: Text("NIK", textAlign: TextAlign.left,),
                    ),
                    TextField(
                      controller: _nik,
                      decoration: InputDecoration(
                          hintText: "NIK",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Tanggal Lahir", textAlign: TextAlign.left,),
                    ),
                    TextField(
                      controller: _tanggal_lahir,
                      decoration: InputDecoration(
                          hintText: "Tanggal Lahir",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Umur", textAlign: TextAlign.left,),
                    ),
                    TextField(
                      controller: _umur,
                      decoration: InputDecoration(
                          hintText: "Umur",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Alamat", textAlign: TextAlign.left,),
                    ),
                    TextField(
                      controller: _alamat,
                      decoration: InputDecoration(
                          hintText: "Alamat",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Nomor HP", textAlign: TextAlign.left,),
                    ),
                    TextField(
                      controller: _nomor_hp,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Nomor HP",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Tinggi Badan", textAlign: TextAlign.left,),
                    ),
                    TextField(
                      controller: _tinggi_badan,
                      decoration: InputDecoration(
                          hintText: "Tinggi Badan",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Berat Badan", textAlign: TextAlign.left,),
                    ),
                    TextField(
                      controller: _berat_badan,
                      decoration: InputDecoration(
                          hintText: "Berat Badan",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Alergi Obat", textAlign: TextAlign.left,),
                    ),
                    TextField(
                      controller: _alergi_obat,
                      decoration: InputDecoration(
                          hintText: "Alergi Obat",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Status Pengobatan", textAlign: TextAlign.left,),
                    ),
                    TextField(
                      controller: _status_pengobatan,
                      decoration: InputDecoration(
                          hintText: "Status Pengobatan",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Jenis Kelamin", textAlign: TextAlign.left,),
                    ),
                    TextField(
                      controller: _jenin_kelamin,
                      decoration: InputDecoration(
                          hintText: "jenis kelamin",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "ID Akses", textAlign: TextAlign.left,),
                    ),
                    TextField(
                      controller: _id_akses,
                      decoration: InputDecoration(
                          hintText: "ID Akses ",
                          border: OutlineInputBorder()
                      ),
                    ),
                    // Column(
                    //   children: [
                    //     SizedBox(
                    //       width: double.infinity,
                    //       child: Text(
                    //         "Jenis Kelamin", textAlign: TextAlign.left,),
                    //     ),
                    //     Row(
                    //       children: [
                    //         Radio(value: 0,
                    //             groupValue: this.select,
                    //             onChanged: (int? value) {
                    //               onchanged(value);
                    //             }),
                    //         Container(width: 10.0,),
                    //         Text("Pria")
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         Radio(value: 1,
                    //             groupValue: this.select,
                    //             onChanged: (int? value) {
                    //               onchanged(value);
                    //             }),
                    //         Container(width: 10.0,),
                    //         Text("Wanita")
                    //       ],
                    //     ),
                    //   ],
                    // ),

                    ElevatedButton(onPressed: () {
                       _postData(context);
                      Navigator.of(context).pop();
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
  void _postData(context) {
    BlocProvider.of<PasienBloc>(context).add(
      CreatePasien(_nama.text, _nik.text, _tanggal_lahir.text, _umur.text,_alamat.text, _nomor_hp.text,_tinggi_badan.text,
          _berat_badan.text, _alergi_obat.text, _status_pengobatan.text,_jenin_kelamin.text,_id_akses.text ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body:
        SingleChildScrollView(
        child:
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _registerFormKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _nameTextController,
                        focusNode: _focusName,
                        validator: (value) => Validator.validateName(
                          name: value,
                        ),
                        decoration: InputDecoration(
                          hintText: "Name",
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _emailTextController,
                        focusNode: _focusEmail,
                        validator: (value) => Validator.validateEmail(
                          email: value,
                        ),
                        decoration: InputDecoration(
                          hintText: "Email",
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordTextController,
                        focusNode: _focusPassword,
                        obscureText: true,
                        validator: (value) => Validator.validatePassword(
                          password: value,
                        ),
                        decoration: InputDecoration(
                          hintText: "Password",
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32.0),
                      _isProcessing
                          ? CircularProgressIndicator()
                          : Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {


                                setState(() {
                                  _isProcessing = true;
                                });

                                if (_registerFormKey.currentState!
                                    .validate()) {
                                  User? user = await FireAuth
                                      .registerUsingEmailPassword(
                                    name: _nameTextController.text,
                                    email: _emailTextController.text,
                                    password:
                                    _passwordTextController.text,
                                  );

                                  setState(() {
                                    _isProcessing = false;
                                  });

                                  if (user != null) {
                                    _create();
                                    // Navigator.of(context)
                                    //     .pushAndRemoveUntil(
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         Home(name: user.toString()),
                                    //   ),
                                    //   ModalRoute.withName('/'),
                                    // );
                                  }
                                }
                              },
                              child: Text(
                                'Selanjutnya',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
                ,
              ],
            ),
          ),
        ),
      ),
      ),
      ),
    );
  }

}

