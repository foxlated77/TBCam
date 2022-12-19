import 'package:equatable/equatable.dart';



abstract class DokterState extends Equatable{}

class InitialState extends DokterState {
  @override
  List<Object> get props => [];

}

class DokterAdding extends DokterState {
  @override
  List<Object> get props => [];

}

class DokterAdded extends DokterState {

  @override
  List<Object> get props => [];

}

class DokterError extends DokterState {
  final String error;
  DokterError(this.error);
  @override
  List<Object> get props => [error];

}