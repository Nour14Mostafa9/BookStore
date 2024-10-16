part of 'add_bloc.dart';

abstract class AddState extends Equatable {
  const AddState();

  @override
  List<Object> get props => [];
}


final class AddInitial extends AddState {}

final class LoadingAddFavBook extends AddState{}

final class ErrorAddFavBook extends AddState{
   final String msg;

  const ErrorAddFavBook({required this.msg});

  @override
  List<Object> get props => [msg];


}


final class MsgAddFavBook extends AddState{
  final String msg;

  const MsgAddFavBook({required this.msg});

  @override
  List<Object> get props => [msg];


}
