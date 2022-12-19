import 'package:equatable/equatable.dart';

abstract class DokterEvent extends Equatable{
  @override
  List<Object> get props => [];

}

class CreateDokter extends DokterEvent{

  final String Nama_Pasien;
  final String Fase_Pengobatan;
  final String Nama_obat;
  final String Dosis;
  final String Catatan;
  final String id_obat;
  CreateDokter(this.Nama_Pasien,this.Fase_Pengobatan, this.Nama_obat, this.Dosis, this.Catatan, this.id_obat, );
}