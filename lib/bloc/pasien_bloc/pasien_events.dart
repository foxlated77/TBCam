import 'package:equatable/equatable.dart';

abstract class PasienEvent extends Equatable{
  @override
  List<Object> get props => [];

}

class CreatePasien extends PasienEvent{

  final String Nama;
  final String NIK;
  final String TTL;
  final String Umur;
  final String Alamat;
  final String HP;
  final String Tinggi;
  final String Berat;
  final String Alergi;
  final String Status;
  final String Kelamin;
  final String id;
  CreatePasien(this.Nama, this.NIK,this.TTL, this.Umur, this.Alamat, this.HP, this.Tinggi, this.Berat, this.Alergi
  , this.Status, this.Kelamin,this.id);
}