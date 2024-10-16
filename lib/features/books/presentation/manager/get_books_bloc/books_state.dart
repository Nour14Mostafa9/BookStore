part of 'books_bloc.dart';

sealed class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

final class BooksInitial extends BooksState {}

final class LoadingBooksState extends BooksState {

}

final class LoadedBooksState extends BooksState {
  List<Book> books;

  LoadedBooksState({required this.books});

  @override
  List<Object> get props => [books];


}

final class ErrorBooksState extends BooksState {

  String msg;

  ErrorBooksState({required this.msg});

  @override
  List<Object> get props => [msg];
}


