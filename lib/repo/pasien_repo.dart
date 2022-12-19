import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';


class PasienRepository{

  final _fireCloud = FirebaseFirestore.instance.collection("Pasien");

  Future<void> create({required String Nama, required String NIK, required String TTL, required String Umur,
  required String Alamat, required String HP, required String Tinggi, required String Berat, required String Alergi,
  required String Status, required String Kelamin, required String id})async{
    try{
      await _fireCloud.doc(id)
          .set({"Nama" : Nama, "NIK" : NIK, "Tanggal_Lahir" : TTL, "Umur" : Umur, "Alamat" : Alamat, "Nomor HP " :HP,
      "Tinggi_Badan": Tinggi, "Berat_Badan" : Berat, "Alergi_Obat" : Alergi, "Status_Pengobatan" : Status, "Jenis_Kelamin" : Kelamin, "id" : id});

      // _fireCloud.add({"name" : name, "birth" : price, "id" : id});
    }on FirebaseException catch(e){
      if(kDebugMode)
      {
        print("Failed with error '${e.code}' : '${e.message}'");
      }

    } catch (e){
      throw Exception(e.toString());
    }
  }
}



