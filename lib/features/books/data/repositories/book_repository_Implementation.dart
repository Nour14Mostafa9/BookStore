import 'package:dartz/dartz.dart';
import 'package:design_pattern/core/error/exceptions.dart';
import 'package:design_pattern/core/error/failure.dart';
import 'package:design_pattern/core/network/network_info.dart';
import 'package:design_pattern/features/books/data/data_sources/book_local_data_source.dart';
import 'package:design_pattern/features/books/data/data_sources/book_remote_data_source.dart';
import 'package:design_pattern/features/books/data/models/book_model.dart';
import 'package:design_pattern/features/books/domain/entities/book.dart';
import 'package:design_pattern/features/books/domain/repositories/book_repo.dart';

class BookRepositoryImplementation extends BookRepository {

  final NetworkInfo info;
  final BookRemoteDataSource remoteDataSource;
  final BookLocalDataSource localDataSource;

  BookRepositoryImplementation({required this.info,required this.remoteDataSource, required this.localDataSource});


  @override
  Future<Either<Failure, List<Book>>> getBooks() async {
    if(await info.isConnected){
      try{
       final remoteData= await remoteDataSource.getBooks();
       return Right(remoteData as List<Book>);

      } on ServerException{
        return Left(ServerFailure());
      }
    }else{
      try{
       final localData= await localDataSource.getCachedBooks();
        return Right(localData as List<Book>);
      } on CacheException{
        return Left(CacheFailure());
      }

    }

  }


  @override
  Future<Either<Failure, Unit>> favBooks(Book book) async{
    final favBook = BookModel(title: book.title, description: book.description,
        averageRating: book.averageRating, smallThumbnail: book.smallThumbnail,previewLink: book.previewLink);

    if(await info.isConnected){
      try{
        await localDataSource.addFavBooks(favBook) ;
        return const Right(unit);
      }on ServerException{
        return Left(ServerFailure());

      }
    }else{
      return Left(NoInternetFailure());
    }
  }



  @override
  Future<Either<Failure, List<Book>>> getFavBooks()async {
    try {
      final localData = await localDataSource.getCachedBooks();
      print(localData);
      return Right(localData as List<Book>);
    } on CacheException {
      return Left(CacheFailure());
    }
  }


}