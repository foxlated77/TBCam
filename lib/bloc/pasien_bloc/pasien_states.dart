import 'package:equatable/equatable.dart';



abstract class PasienState extends Equatable{}

class InitialState extends PasienState {
  @override
  List<Object> get props => [];

}

class PasienAdding extends PasienState {
  @override
  List<Object> get props => [];

}

class PasienAdded extends PasienState {

  @override
  List<Object> get props => [];

}

class PasienError extends PasienState {
  final String error;
  PasienError(this.error);
  @override
  List<Object> get props => [error];

}