part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props=>[];
}


class GetAllFavBooksEvent extends FavouriteEvent{}

class RefreshFavBooksEvent extends FavouriteEvent{}