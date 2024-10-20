part of 'books_bloc.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object> get props=>[];

}

class GetAllBooksEvent extends BooksEvent{
  final String subject;

  const GetAllBooksEvent({required this.subject});
  @override
  // TODO: implement props
  List<Object> get props => [subject];

}

class RefreshBooksEvent extends BooksEvent{
  final String subject;

  const RefreshBooksEvent({required this.subject});
  @override
  // TODO: implement props
  List<Object> get props => [subject];
}