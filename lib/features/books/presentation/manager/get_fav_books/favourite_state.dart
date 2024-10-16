part of 'favourite_bloc.dart';

sealed class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

final class FavouriteInitial extends FavouriteState {

}

final class BooksInitial extends FavouriteState {}

final class LoadingFavBooksState extends FavouriteState {}

final class LoadedFavBooksState extends FavouriteState {
  List<Book> books;

  LoadedFavBooksState({required this.books});

  @override
  List<Object> get props => [books];


}

final class ErrorRetrievingFavBooksState extends FavouriteState {

  String msg;

  ErrorRetrievingFavBooksState({required this.msg});

  @override
  List<Object> get props => [msg];
}