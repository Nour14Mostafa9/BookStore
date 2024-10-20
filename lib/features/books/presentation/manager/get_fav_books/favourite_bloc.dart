import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../domain/entities/book.dart';
import '../../../domain/use_cases/get_fav_books.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final GetFavBooks favouriteBooks;
  FavouriteBloc({required this.favouriteBooks}) : super(FavouriteInitial()) {
    on<FavouriteEvent>((event, emit) async{
      if(event is GetAllFavBooksEvent || event is RefreshFavBooksEvent){
        emit(LoadingFavBooksState());

        final favBooks = await favouriteBooks();
        //print(favBooks);
        favBooks.fold(
                (failure){
              emit(ErrorRetrievingFavBooksState(msg: mappingFailureToMsg(failure)));
            },
                (favouriteBooks){
              // print("tmam");
              emit(LoadedFavBooksState(books: favouriteBooks));
            }
        );
      }
    });
  }


  String mappingFailureToMsg (Failure failure){

    switch(failure.runtimeType){
      case CacheFailure :
        return AppStrings.CACHE_FAILURE_MSG;
      default:
        return "Try again Later...";
    }
  }
}