part of 'add_bloc.dart';

abstract class AddEvent extends Equatable {
  const AddEvent();

  @override
  List<Object?> get props => [];
}


class AddFavBookEvent extends AddEvent{
   final Book favBook;

  const AddFavBookEvent({required this.favBook});

   @override
   List<Object?> get props => [favBook];


}