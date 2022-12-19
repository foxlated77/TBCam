

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor1/bloc/pasien_bloc/pasien_events.dart';
import 'package:tutor1/bloc/pasien_bloc/pasien_states.dart';

import 'package:tutor1/repo/pasien_repo.dart';

class PasienBloc extends Bloc<PasienEvent, PasienState> {
  final PasienRepository pasienRepository;
  PasienBloc({required this.pasienRepository}) : super(InitialState()) {
    on<CreatePasien>((event, emit) async {
      emit(PasienAdding());
      await Future.delayed(const Duration(seconds: 1));
      try {
        await pasienRepository.create(
            Nama: event.Nama, NIK: event.NIK, TTL: event.TTL, Umur: event.Umur, Alamat: event.Alamat, HP: event.HP, Tinggi: event.Tinggi,
        Berat: event.Berat, Alergi: event.Alergi, Status : event.Status,Kelamin: event.Kelamin, id: event.id);
        emit(PasienAdded());
      } catch (e) {
        emit(PasienError(e.toString()));
      }
    });

  }
}




