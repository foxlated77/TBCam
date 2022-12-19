

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor1/bloc/dokter_bloc/dokter_events.dart';
import 'package:tutor1/bloc/dokter_bloc/dokter_states.dart';
import 'package:tutor1/repo/dokter_repo.dart';


class DokterBloc extends Bloc<DokterEvent, DokterState> {
  final DokterRepository dokterRepository;
  DokterBloc({required this.dokterRepository}) : super(InitialState()) {
    on<CreateDokter>((event, emit) async {
      emit(DokterAdding());
      await Future.delayed(const Duration(seconds: 1));
      try {
        await dokterRepository.create(
            Nama_Pasien: event.Nama_Pasien,Fase_Pengobatan: event.Fase_Pengobatan ,Nama_obat: event.Nama_obat,Dosis: event.Dosis,Catatan: event.Catatan,id_obat: event.id_obat );
        emit(DokterAdded());
      } catch (e) {
        emit(DokterError(e.toString()));
      }
    });

  }
}




