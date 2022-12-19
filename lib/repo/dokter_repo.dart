import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';


class DokterRepository{

  final _fireCloud = FirebaseFirestore.instance.collection("Informasi_Obat");

  Future<void> create({required String Nama_Pasien,required String Fase_Pengobatan , required String Nama_obat,required String Dosis, required String Catatan, required String id_obat})async{
    try{
      await _fireCloud.doc(id_obat)
          .set({"Nama_Pasien" : Nama_Pasien,"Fase_Pengobatan" : Fase_Pengobatan  , "Nama_obat" : Nama_obat,"Dosis" : Dosis,"Catatan" : Catatan,  "id_obat" : id_obat});

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



