import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor1/bloc/pasien_bloc/pasien_blocs.dart';
import 'package:tutor1/repo/pasien_repo.dart';
import 'package:tutor1/bloc/pasien_bloc/pasien_states.dart';
import 'package:tutor1/ui/daftar_page/list_data_pasien.dart';
import 'package:tutor1/ui/daftar_page/register.dart';




class add_data_pasien extends StatelessWidget {
  const add_data_pasien({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home:  RepositoryProvider(
          create: (context) => PasienRepository(),
          child: const Home_add_data(),
        )
    );
  }
}

class Home_add_data extends StatelessWidget {
  const Home_add_data({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (context) => PasienBloc(
          pasienRepository:RepositoryProvider.of<PasienRepository>(context)
      ),
      child: Scaffold(
          key: scaffoldKey,
          body: BlocListener<PasienBloc, PasienState>(
              listener: (context, state) {
                if (state is PasienAdded) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Read_all_data_pasien(kode_kses: '', nama_user: '')));
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Pasien sukses ditambahkan"), duration: Duration(seconds: 2),));
                }
              },
              child: BlocBuilder<PasienBloc, PasienState>(
                builder: (context, state) {
                  if (state is PasienAdding) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }else if(state is PasienError){
                    return const Center(child:Text("Error"));

                  }
                  return const Register();
                },
              )
          )
      ),
    );
  }
}
