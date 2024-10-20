import 'package:bloc/bloc.dart';
import 'package:design_pattern/core/error/failure.dart';
import 'package:design_pattern/core/utils/app_strings.dart';
import 'package:design_pattern/features/books/domain/entities/book.dart';
import 'package:equatable/equatable.dart';
import 'package:design_pattern/features/books/domain/use_cases/get_all_books.dart';


part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final GetAllBooks getAllBooks;
  BooksBloc({required this.getAllBooks}) : super(BooksInitial()) {
    on<BooksEvent>((event, emit) async {
      if(event is GetAllBooksEvent ){
        emit(LoadingBooksState());

        final books = await getAllBooks(event.subject);
        books.fold(
             (failure){
               emit(ErrorBooksState(msg: MappingFailureToMsg(failure)));
            },
            (books){
               emit(LoadedBooksState(books: books));
            },);
      }
    });
  }


  String MappingFailureToMsg (Failure failure){

    switch(failure.runtimeType){
      case ServerFailure :
        return AppStrings.SERVER_FAILURE_MSG;
      case CacheFailure :
        return AppStrings.CACHE_FAILURE_MSG;
      case NoInternetFailure:
        return AppStrings.NO_INTERNET_ERROR_MSG;
      default:
        return "Try again Later...";
    }
  }
}


