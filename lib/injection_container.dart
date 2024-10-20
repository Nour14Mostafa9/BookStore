import 'package:design_pattern/config/theme/theme_bloc.dart';
import 'package:design_pattern/core/network/network_info.dart';
import 'package:design_pattern/features/books/data/data_sources/book_local_data_source.dart';
import 'package:design_pattern/features/books/data/data_sources/book_remote_data_source.dart';
import 'package:design_pattern/features/books/data/repositories/book_repository_Implementation.dart';
import 'package:design_pattern/features/books/domain/repositories/book_repo.dart';
import 'package:design_pattern/features/books/presentation/manager/add_fav_bloc/add_bloc.dart';
import 'package:design_pattern/features/books/presentation/manager/get_books_bloc/books_bloc.dart';
import 'package:design_pattern/features/books/presentation/manager/get_fav_books/favourite_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/books/domain/use_cases/fav_books.dart';
import 'features/books/domain/use_cases/get_all_books.dart';
import 'features/books/domain/use_cases/get_fav_books.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  
  //!Features
    //bloc 
    sl.registerFactory(()=>AddBloc(favouriteBooks: sl()));
    sl.registerFactory(()=>FavouriteBloc(favouriteBooks:sl()));
    sl.registerFactory(()=>BooksBloc(getAllBooks: sl()));

    //Use-case
    sl.registerLazySingleton(()=>GetAllBooks(sl()));
    sl.registerLazySingleton(()=>GetFavBooks(sl()));
    sl.registerLazySingleton(()=>FavouriteBooks(sl()));

    //Repository
    sl.registerLazySingleton<BookRepository>(()=>BookRepositoryImplementation(info: sl(), remoteDataSource: sl(), localDataSource: sl()));

    //Datasource
    sl.registerLazySingleton<BookRemoteDataSource>(()=>BookRemoteImpWithHttp(client: sl()));
    sl.registerLazySingleton<BookLocalDataSource>(()=>BookLocalImp(sl()));

  //!core
    sl.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(InternetConnectionChecker()));

  //!External
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(()=>sharedPreferences);
    
    sl.registerLazySingleton(()=> http.Client());

    //Theme
    sl.registerLazySingleton<ThemeBloc>(()=>ThemeBloc());
    
    

}