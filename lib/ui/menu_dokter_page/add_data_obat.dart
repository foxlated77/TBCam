import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor1/bloc/dokter_bloc/dokter_blocs.dart';
import 'package:tutor1/bloc/dokter_bloc/dokter_states.dart';
import 'package:tutor1/repo/dokter_repo.dart';
import 'package:tutor1/ui/menu_dokter_page/List_obat.dart';
import 'package:tutor1/ui/menu_dokter_page/buat_resep_obat.dart';





class add_informasi_obat extends StatelessWidget {
  const add_informasi_obat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  RepositoryProvider(
          create: (context) => DokterRepository(),
          child: const Home_add_data_obat(),
        )
    );
  }
}

class Home_add_data_obat extends StatelessWidget {
  const Home_add_data_obat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (context) => DokterBloc(
          dokterRepository:RepositoryProvider.of<DokterRepository>(context)
      ),
      child: Scaffold(
          key: scaffoldKey,
          body: BlocListener<DokterBloc, DokterState>(
              listener: (context, state) {
                if (state is DokterAdded) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>List_obat(kode_kses: "", nama_user: "")
                    // Read_all_data_pasien(kode_kses: '',nama_user: '',)
                  ));
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Pasien ditambahkan"), duration: Duration(seconds: 2),));
                }
              },
              child: BlocBuilder<DokterBloc, DokterState>(
                builder: (context, state) {
                  if (state is DokterAdding) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }else if(state is DokterError){
                    return const Center(child:Text("Error"));

                  }
                  return const Buat_informasi_obat();
                },
              )
          )
      ),
    );
  }
}