import 'package:bloc/bloc.dart';
import 'package:design_pattern/features/books/domain/entities/book.dart';
import 'package:design_pattern/features/books/domain/use_cases/fav_books.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/app_strings.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  final FavouriteBooks favouriteBooks;
  AddBloc({required this.favouriteBooks}) : super(AddInitial()) {
    on<AddEvent>((event, emit) async{
     if(event is AddFavBookEvent){
       emit(LoadingAddFavBook());

       final addFavourite = await favouriteBooks(event.favBook);

       addFavourite.fold(
             (failure){
           emit(ErrorAddFavBook(msg: mappingFailureToMsg(failure)));
         },
             (_){
           emit(const MsgAddFavBook(msg: AppStrings.SUCCESSFULLY_ADDED_FAV_MSG));
         },);
     }
    });
  }

  String mappingFailureToMsg (Failure failure){

    switch(failure.runtimeType){
      case ServerFailure :
        return AppStrings.SERVER_FAILURE_MSG;
      case NoInternetFailure:
        return AppStrings.NO_INTERNET_ERROR_MSG;
      case CacheFailure:
        return AppStrings.CACHE_FAILURE_MSG;
      default:
        return "Try again Later...";
    }
  }
}
